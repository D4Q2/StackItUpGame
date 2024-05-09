extends RigidBody2D

@export var speed: float = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	lock_rotation = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_box = get_child(0)
	var half_box_width = collision_box.scale.x * 10
	var viewport_width = get_viewport().size.x
	var mouse_pos = get_viewport().get_mouse_position()
	
	var dist_to_mouse = abs(mouse_pos.x - position.x)
	
	if mouse_pos.x < position.x:
		linear_velocity = Vector2(-1 * speed * dist_to_mouse, 0)
	elif mouse_pos.x > position.x:
		linear_velocity = Vector2(speed * dist_to_mouse, 0)
	else:
		linear_velocity = Vector2(0, 0)
	
	#if position.x + linear_velocity.x * delta < half_box_width:
		#linear_velocity = Vector2(0,0)
		#return
	
	#if mouse_pos.x - half_box_width < 0:
		#position.x = half_box_width
	#elif mouse_pos.x + half_box_width > viewport_width:
		#position.x = viewport_width - half_box_width
	#else:
		#position.x = mouse_pos.x
