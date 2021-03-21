extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = []
var path_node = 0
var speed = 10
onready var player = get_node('/root/Office/Player')
onready var anim = get_node("AnimationPlayer")
onready var nav = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim.play("Run")
	pass

func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction < 1:
			path_node += 1
		else :
			move_wand_slide(direction.normalized * speed, Vector3.UP)
			

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0
