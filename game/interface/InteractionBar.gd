extends Control

class_name InteractionBar

var label

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label
	set_text(null)

func set_text(text):
	if text:
		# var interact_key = OS.get_scancode_string(InputMan.get_action_list("Interact")[0].scancode)
		label.set_text("Press E to %s" % text)
		self.set_visible(true)
	else:
		label.set_text("")
		self.set_visible(false)
