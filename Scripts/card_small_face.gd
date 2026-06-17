extends TileMapLayer

var testCoords = Vector2i(3,3)
var cardPattern : TileMapPattern
var cardTileSet: TileSet = self.tile_set



func cardFaceGen(num_index:int,sym_index:int):
	cardPattern = cardTileSet.get_pattern(num_index)
	
	if num_index >= 1 && num_index <9  :
		testCoords = Vector2i(1,1)
	elif num_index == 9 :
		testCoords = Vector2i(0,1)
	else :
		testCoords = Vector2i(3,3)
	
	set_pattern(testCoords,cardPattern)


	
	
	
