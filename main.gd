extends Node
var cardPos_X=0
var cardPos_Y=80
var cardOffset=52

var loadCard= preload("res://card.tscn")
@export var new_Card:PackedScene

func card_Spawn():
	for i in range(6):
		var card= loadCard.instantiate()
		card.position= Vector2(int(cardPos_X+(i*cardOffset)),cardPos_Y)
		add_child(card)
		
func _ready() -> void:
	card_Spawn()
	
