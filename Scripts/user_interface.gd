extends Node2D

@export var new_Card: PackedScene = preload("res://Scenes/card.tscn")



func card_spawn(cardPos_X:int,cardPos_Y:int):
	var Hand: Array = []
	const cardOffset: int = 48
	const maxHandSize = 5
	
	while Hand.size() < maxHandSize:
		var card = new_Card.instantiate()
		card.name = "Card_%d" % Hand.size()
		add_child(card)
		card.GenerateCard()

		var cardDets = str(card.card_info.num) + str(card.card_info.type)
		

		# Skip duplicates
		if Hand.has(cardDets):
			print("Duplicate generated:", cardDets) #for Debug
			card.queue_free()
			continue

		Hand.append(cardDets)
		card.position = Vector2(cardPos_X + ((Hand.size() - 1) * cardOffset),cardPos_Y)
		card.initialPos = card.global_position

	var children = get_children()

	for crd in range(children.size()):
		var card = children[crd]

		var normalized_index := 0.0
		if children.size() > 1:
			normalized_index = float(crd) / float(children.size() - 1)

		print(card.name," pos=", card.position," index=", normalized_index)

	return Hand

	
