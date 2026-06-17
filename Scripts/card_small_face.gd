extends TileMapLayer

const SPADE   := 0
const CLUB    := 1
const DIAMOND := 2
const HEART   := 3

var testCoords := Vector2i(3, 3)
var cardPattern: TileMapPattern
var cardTileSet: TileSet = tile_set
var faceColor: ShaderMaterial


func _replace_pattern_tiles(atlas_coords: Vector2i) -> void:
	for cell in cardPattern.get_used_cells():
		cardPattern.set_cell(cell, 0, atlas_coords, 0)


func _get_number_suit_coords(sym_index: int) -> Vector2i:
	match sym_index:
		CLUB:
			return Vector2i(1, 14)
		DIAMOND:
			return Vector2i(2, 14)
		HEART:
			return Vector2i(3, 14)
		_:
			return Vector2i(0, 14) # SPADE


func _get_ace_suit_coords(sym_index: int) -> Vector2i:
	match sym_index:
		CLUB:
			return Vector2i(5, 10)
		DIAMOND:
			return Vector2i(10, 10)
		HEART:
			return Vector2i(15, 10)
		_:
			return Vector2i(0, 10) # SPADE


func _set_face_color(sym_index: int) -> void:
	if faceColor:
		faceColor.set_shader_parameter(
			"isBlack",
			sym_index in [SPADE, CLUB]
		)


func cardFaceGen(num_index: int, sym_index: int) -> void:
	cardPattern = cardTileSet.get_pattern(num_index)

	if material:
		material = material.duplicate()
		faceColor = material as ShaderMaterial

	match num_index:
		0: # Ace
			testCoords = Vector2i(3, 3)
			_replace_pattern_tiles(_get_ace_suit_coords(sym_index))

		1, 2, 3, 4, 5, 6, 7, 8:
			testCoords = Vector2i(1, 1)
			_replace_pattern_tiles(_get_number_suit_coords(sym_index))

		9: # 10
			testCoords = Vector2i(0, 1)
			_replace_pattern_tiles(_get_number_suit_coords(sym_index))

		_: # K, Q, J
			testCoords = Vector2i(3, 3)
			_set_face_color(sym_index)

	set_pattern(testCoords, cardPattern)
