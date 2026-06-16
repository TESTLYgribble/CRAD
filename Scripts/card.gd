extends Node2D

const val: Array[String] = ["A","2","3","4","5","6","7","8","9","10","K","Q","J"]
const cardTypes = ["spd","clvr","dmnd","hrts"]

@onready var card_symbol = get_node_or_null("whiteCard/Card_symbol")
@onready var card_value = get_node_or_null("whiteCard/Card_Value")

var card_color : ShaderMaterial
var rnd_info: Array[int]
var card_info = {
	num = "NULL",
	type = "NULL"
}

func GenerateCard() -> void:
	if card_value and card_value.material:
		card_value.material = card_value.material.duplicate()
		card_color = card_value.material as ShaderMaterial
	
	Rnd_Card_Gen()
	randomCardDetails()
	checkBlack()
	debug_info()


func Rnd_Card_Gen() -> void:
	var numR: int = randi() % val.size()
	var typR: int = randi() % cardTypes.size()

	rnd_info = [typR, numR]

	card_info.num = val[numR]
	card_info.type = cardTypes[typR]

	
func randomCardDetails() -> void:
	# Added safety checks so it doesn't crash if Godot has a timing glitch
	if card_symbol:
		card_symbol.animation = "sym_Types"
		card_symbol.frame = rnd_info[0]

	if card_value:
		card_value.animation = "Val_Text"
		card_value.frame = rnd_info[1]


func checkBlack():
	if not card_color:
		return
		
	if rnd_info[0] in [0, 1]:
		card_color.set_shader_parameter("isBlack", true)
	else:
		card_color.set_shader_parameter("isBlack", false)


func debug_info():
	print("Card: %s | Parent: %s | Path: %s" % [
		card_ID(),
		get_parent(),
		get_path()
	])
	
func card_ID()-> String:
	return "%s_%s" % [card_info.num, card_info.type]
	
	
