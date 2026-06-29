extends Button
const SUIT_ORDER := {
	"spd": 0,
	"clvr": 1,
	"dmnd": 2,
	"hrts": 3
}

const RANK_ORDER := {
	"A": 0,
	"2": 1,
	"3": 2,
	"4": 3,
	"5": 4,
	"6": 5,
	"7": 6,
	"8": 7,
	"9": 8,
	"10": 9,
	"J": 10,
	"Q": 11,
	"K": 12
}

func sort_hand(hand: Array):
	hand.sort_custom(func(a: String, b: String):
		var ac = a.split("_")
		var bc = b.split("_")

		var suitA = SUIT_ORDER[ac[1]]
		var suitB = SUIT_ORDER[bc[1]]

		if suitA != suitB:
			return suitA < suitB

		return RANK_ORDER[ac[0]] < RANK_ORDER[bc[0]]
	)


func _on_button_down() -> void:
	var card_hand_node = get_parent().get_node("Card_Hand")
	var hand = card_hand_node.Hand
	sort_hand(hand)

	const cardOffset := 32
	const startX := 48
	const posY := 224

	var children = card_hand_node.get_children()

	for i in range(hand.size()):
		var card_id = hand[i]

		for card in children:
			if card.card_ID() == card_id:

				var target_pos = Vector2(
					startX + i * cardOffset,
					posY
				)

				# Save the new position for future use
				card.initialPos = target_pos

				# Animate to the new position
				var tween = card.create_tween()
				tween.set_trans(Tween.TRANS_SINE)
				tween.set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(card, "position", target_pos, 0.35)

				# Only for debugging
				var normalized_index := 0.0
				if hand.size() > 1:
					normalized_index = float(i) / float(hand.size() - 1)

				print(card.name, " -> index=", normalized_index)

				break
