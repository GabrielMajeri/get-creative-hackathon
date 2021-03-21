extends Node

# A way for us to determine if an object is interactable

class_name Interactable

func get_interaction_text():
	return "Interact"
	
func interact():
	get_tree().change_scene("res://office_scene/Office.tscn")

