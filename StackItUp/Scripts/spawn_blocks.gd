extends Node2D

@export var interval: float = 1
@export var block_types: Array[String] = [
	"res://Prefabs/stone_block.tscn",
	"res://Prefabs/tile_block.tscn",
	"res://Prefabs/wood_block.tscn"
]
@export var side_padding: float = 100

var time_since_spawned: float = 0
var random_number_generator


# Called when the node enters the scene tree for the first time.
func _ready():
	random_number_generator = RandomNumberGenerator.new()
	time_since_spawned = interval


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_spawned += delta
	
	if time_since_spawned >= interval:
		time_since_spawned = 0
		
		var block_type: int = random_number_generator.randi_range(0, block_types.size() - 1)
		var block_resource = load(block_types[block_type])
		var block = block_resource.instantiate()
		add_child(block)
		
		var viewport_width = get_viewport().size.x
		block.position.y = -30
		block.position.x = random_number_generator.randf_range(side_padding, viewport_width - side_padding)
