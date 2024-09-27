extends Area2D

class_name Enemy

@export var horizontal_speed = 20
@export var vertical_speed = 100


func _process(delta):
	position.x -= delta
