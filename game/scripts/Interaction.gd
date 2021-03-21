extends RayCast

# Check whether or not we are colliding with an object
# if we are colliding with an object we will detect whether or not that object is
# interactable by seeing if it extends the `Interactable` class
# if it is, show some text and mechanism for it to use

var interaction_bar: InteractionBar
var current_collider

func _ready():
	set_process(false)

func enable():
	var gui = get_tree().current_scene.find_node("GUI")
	interaction_bar = gui.enable_interaction_bar()
	set_process(true)

func _process(delta):
	var collider = get_collider()

	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			# just look at something new
			interaction_bar.set_text(collider.get_interaction_text())
			current_collider = collider
		# Project(left corener) -> Project Settings -> Input Map -> Action ->
		# "Interact" -> Key -> "E"
		if Input.is_action_just_pressed("interact"):
			collider.interact()
			# for example "Turn the light ON" / Off
			interaction_bar.set_text(collider.get_interaction_text())
	elif current_collider:
		# if we are not colling with anything, null the current collider
		# we are not looking at anything
		current_collider = null
		interaction_bar.set_text("")
