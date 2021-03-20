extends Node

# A way for us to determin if an object is interactable

class_name Interactable

func get_interactable_text():
	return "Interact"
	
func interact():
	print("Interacted with %s" % name)
