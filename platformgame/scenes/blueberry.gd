extends Enemy

class_name blueberry

var in_a_shell = false
const BLUEBERRY_SHELL_COLLISION_SHAPE_POSITION = Vector2(0, 4)
const BLUEBERRY_FULL_COLLISION_SHAPE = preload("res://resources/collision_shapes/blueberry_full_collision_shape.tres")
const BLUEBERRY_SHELL_COLLISION_SHAPE = preload("res://resources/collision_shapes/blueberry_shell_collision_shape.tres")
@onready var collision_shape_2d = $CollisionShape2D
@onready var slide_speed = 200

func _ready():
	collision_shape_2d.shape = BLUEBERRY_FULL_COLLISION_SHAPE

func die():
	if !in_a_shell:
		super.die()
		
	collision_shape_2d.set_deferred("shape", BLUEBERRY_SHELL_COLLISION_SHAPE) 
	collision_shape_2d.set_deferred("position", BLUEBERRY_SHELL_COLLISION_SHAPE_POSITION)
	in_a_shell = true
	
func on_stomp(player_position: Vector2):
	set_collision_mask_value(1, false)
	set_collision_layer_value(3, false)
	set_collision_layer_value(4, true)

	var movement_direction = 1 if player_position.x <= global_position.x else - 1
	horizontal_speed = -movement_direction * slide_speed
