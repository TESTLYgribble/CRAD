extends TileMapLayer

@onready var card = owner
var cardPattern:TileMapPattern
const patternStart = Vector2i(2,0)
var intCardFaceValue = 3



func faceValAssign():
	cardPattern = tile_set.get_pattern(intCardFaceValue-1)
	set_pattern(patternStart,cardPattern)
 
func _ready() -> void:
	faceValAssign()
	
