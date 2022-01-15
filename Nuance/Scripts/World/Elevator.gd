extends Node2D

const IDLE_DURATION=1.0

#aliases
onready var tween=$Tween
onready var Elevator=$KinematicElevator

# Variables modifiables dans le main
export var move_to=Vector2.UP*250 #correspond au y
export var speed=150
export var _scale = Vector2(2.5, 0.5) #taille de notre ascenceur
export var couleur_elevator=1

var follow=Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(_scale)

	
	_init_tween()

func _init_tween():
	var duration=move_to.length()/float(speed)
	tween.interpolate_property(self,"follow",Vector2.ZERO,move_to,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,IDLE_DURATION)
	tween.interpolate_property(self,"follow",move_to,Vector2.ZERO,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,duration + IDLE_DURATION)
	tween.start()


func _physics_process(_delta):
	Elevator.position = Elevator.position.linear_interpolate(follow,0.075)
