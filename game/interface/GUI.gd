extends Control

var interaction_bar

func enable_interaction_bar():
	if interaction_bar == null:
		interaction_bar = load("res://interface/InteractionBar.tscn").instance()
		add_child(interaction_bar)
	return interaction_bar
