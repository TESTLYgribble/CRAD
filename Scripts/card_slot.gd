extends Area2D

func _process(_delta):
	for card in get_tree().get_nodes_in_group("cards"):
		if card.isCardDragged:
			visible = true
			return

	visible = true
