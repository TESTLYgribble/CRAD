extends Node

var cardPos_X: int = 0
var cardPos_Y: int = 80
var cardOffset: int = 52

# Best practice: Use your exported variable in the inspector, 
# or fallback to preload if it's empty
@export var new_Card: PackedScene = preload("res://Scenes/card.tscn")

func card_Spawn():
	for i in range(5):
		var card = new_Card.instantiate()
		
		# Set positions before adding to child so it doesn't jump visual frames
		card.position = Vector2(cardPos_X + (i * cardOffset), cardPos_Y)
		
		add_child(card)
		card.GenerateCard()
		
func _ready() -> void:
	randomize()
	card_Spawn()
