extends Node2D

const val:Array[String] = ["A","2","3","4","5","6","7","8","9","10","K","Q","J"]
const cardTypes = ["spd","clvr","dmnd","hrts"]

@onready var card_symbol = $whiteCard/Card_symbol
@onready var card_value = $whiteCard/Card_Value

var card_color : ShaderMaterial

var rnd_info:Array[int]

var card_info = {
	num = "NULL",
	type = "NULL"
}

func _ready() -> void:

	# Make shader material unique
	card_value.material = card_value.material.duplicate()

	# Get the duplicated material
	card_color = card_value.material as ShaderMaterial

	randomize()

	Rnd_Card_Gen()
	randomCardDetails()
	checkBlack()

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


func checkBlack():

	if rnd_info[0] in [0, 1]:
		card_color.set_shader_parameter("isBlack", true)
	else:
		card_color.set_shader_parameter("isBlack", false)
