extends Node

var cardPos_X: int = 0
var cardPos_Y: int = 80
var cardOffset: int = 52

var gen_hand: Array = []

@export var new_Card: PackedScene = preload("res://Scenes/card.tscn")

func card_spawn():
	var Hand: Array = []

	while Hand.size() < 5:
		var card = new_Card.instantiate()
		add_child(card)
		card.GenerateCard()

		var cardDets = str(card.card_info.num) + str(card.card_info.type)

		# Skip duplicates
		if Hand.has(cardDets):
			print("Duplicate generated:", cardDets) #for Debug
			card.queue_free()
			continue

		Hand.append(cardDets)

		card.position = Vector2(
			cardPos_X + ((Hand.size() - 1) * cardOffset),
			cardPos_Y
		)

		

	gen_hand.append(Hand)

func debug_info():
	print("Current Hand:", gen_hand)

func _ready() -> void:
	randomize()
	card_spawn()
	debug_info()
