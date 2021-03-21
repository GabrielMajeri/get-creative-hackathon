extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_button = $Menu/CenterRow/Buttons/StartGameButton
	start_button.connect("pressed", self, "_start_button_pressed")

	var quit_button = $Menu/CenterRow/Buttons/QuitGameButton
	quit_button.connect("pressed", self, "_quit_button_pressed")

func _start_button_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")

func _quit_button_pressed():
	# Exit the game
	get_tree().quit()
