extends RayCast

# check whetaher or not we are colliding with an object
# if we are colliding with an object we will detect weather or not that object is
# interactable using the script Interactable/Interactable.bg
# if it is, show some text and mechanism for it to use

var current_collider

func _process(delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			current_collider = collider
		# Project(left corener) -> Project Settings -> Input Map -> Action ->
		# "Interact" -> Key -> "E"
		if Input.is_action_just_pressed("Interact"):
			collider.interact()
	elif current_collider:
		# if we are not colling with anything, null the current collider
		current_collider = null
