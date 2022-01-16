extends StaticBody2D


export var _scale := Vector2(1, 1)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
