extends Node2D

const val:Array[String] = ["A","2","3","4","5","6","7","8","9","10","K","Q","J"]
const cardTypes = ["spd","clvr","dmnd","hrts"]

@onready var card_symbol = $whiteCard/Card_symbol
@onready var card_value = $whiteCard/Card_Value

var rnd_info:Array[int]

var card_info = {
	num = "NULL",
	type = "NULL"
}

func _ready() -> void:
	randomize()
	Rnd_Card_Gen()
	randomCardDetails()
	print("Hello!")


func Rnd_Card_Gen() -> void:
	var numR:int = randi() % val.size()
	var typR:int = randi() % cardTypes.size()

	rnd_info = [typR, numR]

	card_info.num = val[numR]
	card_info.type = cardTypes[typR]

	print(card_info.num, " ", card_info.type)


func randomCardDetails() -> void:
	card_symbol.animation = "sym_Types"
	card_symbol.frame = rnd_info[0]

	card_value.animation = "Val_Text"
	card_value.frame = rnd_info[1]
