extends Camera

func _physics_process(delta):
	# Move camera forward
	if Input.is_action_pressed("move_forward"):
		# Move as long as the key/button is pressed
		self.transform.origin += -self.transform.basis.z * delta

	# Move camera backward
	if Input.is_action_pressed("move_backward"):
		self.transform.origin += self.transform.basis.z * delta
