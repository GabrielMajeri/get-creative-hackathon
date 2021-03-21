extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = []
var path_node = 0
var speed = 10
var isRunning = 0
var hitting = 0
onready var nav = get_parent()
onready var player = get_node("/root/Office/Player")
#onready var player = $"../..//Player"
onready var anim = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hitting):
		anim.play("Attack_1")
	else:
		if(isRunning):
			anim.play("Run")
		else:
			anim.play("Idle-loop")

func _physics_process(delta):
	if path_node < path.size():
		isRunning = 1
		hitting = 0
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node += 1
		else : 
			move_and_slide(direction.normalized() * speed, Vector3.UP)
	else:
		isRunning = 0
		hitting = 1
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0


func _on_Timer_timeout():
	move_to(player.global_transform.origin)
	pass # Replace with function body.
