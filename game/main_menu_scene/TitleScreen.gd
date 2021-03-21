extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var quit_button = $Menu/CenterRow/Buttons/QuitGameButton
	quit_button.connect("pressed", self, "_quit_button_pressed")

func _quit_button_pressed():
	# Exit the game
	get_tree().quit()
