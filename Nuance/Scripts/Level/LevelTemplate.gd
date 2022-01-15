extends Node2D

class_name LevelTemplate

signal finish

onready var spawn_point : Vector2 = $SpawnPoint.position

func _ready():
	get_parent().set_spawn_point(spawn_point)

func _on_AreaEnd_body_entered(body):
	if body is Player:
		emit_signal("finish")
