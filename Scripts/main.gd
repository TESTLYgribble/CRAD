extends Node

var cardPos_X: int = 0
var cardPos_Y: int = 80
var cardOffset: int = 52

var gen_hand: Array = []


@export var new_card_Place: PackedScene = preload("res://Scenes/UserInterface.tscn")

func debug_info():
	print("Current Hand:", gen_hand)

func GUIsettings():
	var card_Place = new_card_Place.instantiate()
	add_child(card_Place)
	var deckHand = card_Place.get_node("Card_Hand")
	var Hand = deckHand.card_spawn(20,100)
	gen_hand.append(Hand)



func _ready() -> void:
	randomize()
	GUIsettings()
	debug_info()
	
	
