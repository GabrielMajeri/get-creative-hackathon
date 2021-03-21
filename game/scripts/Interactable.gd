extends Node

# A way for us to determine if an object is interactable

class_name Interactable

func get_interaction_text():
	return "Interact"
	
func interact():
	print("Interacted with %s" % name)
