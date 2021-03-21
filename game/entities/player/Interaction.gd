extends RayCast

# check whetaher or not we are colliding with an object
# if we are colliding with an object we will detect weather or not that object is
# interactable using the script Interactable/Interactable.bg
# if it is, show some text and mechanism for it to use

var current_collider

func _ready():
	set_interaction_text("")

func _process(delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			# just look at something new
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
		# Project(left corener) -> Project Settings -> Input Map -> Action ->
		# "Interact" -> Key -> "E"
		if Input.is_action_just_pressed("Interact"):
			collider.interact()
			# for example "Turn the light ON" / Off
			set_interaction_text(collider.get_interaction_text())
	elif current_collider:
		# if we are not colling with anything, null the current collider
		# we are not looking at anything
		current_collider = null


func set_interaction_text(text):
	var interaction_label = get_node("/root/House/UI/InteractionLabel")
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		# var interact_key = OS.get_scancode_string(InputMan.get_action_list("Interact")[0].scancode)
		interaction_label.set_text("Press E to %s" % text)
		interaction_label.set_visible(true)
