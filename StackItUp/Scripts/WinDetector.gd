extends Area2D

@export var win_message: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body: RigidBody2D in get_overlapping_bodies():
		if body.linear_velocity.length() < 1:
			win_message.visible = true
