extends Node2D

class_name LevelTemplate

signal finish

onready var spawn_point : Vector2 = $SpawnPoint.position

export (bool) var reset_when_died : bool = false

func _ready():
	get_parent().set_spawn_point(spawn_point)

func _on_AreaEnd_body_entered(body):
	if body is Player:
		if $AreaEnd.position.distance_to(body.position)<50:
			emit_signal("finish")
