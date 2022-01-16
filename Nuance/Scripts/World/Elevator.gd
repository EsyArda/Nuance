extends Node2D

class_name Elevator

const IDLE_DURATION=1.0

#aliases
onready var tween=$Tween
onready var Elevator=$KinematicElevator

# Variables modifiables dans le main
export var move_to=Vector2.UP*250 #correspond au y
export var speed=150
export var _scale = Vector2(2.5, 0.5) #taille de notre ascenceur
export var couleur_elevator=1 #couleur de la plateforme (1=noir,2=rouge,3=bleu)

var follow=Vector2.ZERO
var color : Color = Color.white

# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(_scale)
	if (couleur_elevator==1) :
		$KinematicElevator/Color.color= Color(0, 0, 0, 1) #black
		color = Color.black
	elif (couleur_elevator==2) :
		$KinematicElevator/Color.color= Color(1, 0, 0, 1) #red
		color = Color(1, 0, 0, 1)
	elif (couleur_elevator==3) :
		$KinematicElevator/Color.color= Color(0, 0, 1, 1) #blue
		color = Color(0, 0, 1, 1)
	elif (couleur_elevator==4) :
		print("?")
		$KinematicElevator/Color.color= Color(0, 1, 0, 1) #green
		color = Color(0, 1, 0, 1)
	
	_init_tween()

func _init_tween():
	var duration=move_to.length()/float(speed)
	tween.interpolate_property(self,"follow",Vector2.ZERO,move_to,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,IDLE_DURATION)
	tween.interpolate_property(self,"follow",move_to,Vector2.ZERO,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,duration + IDLE_DURATION)
	tween.start()


func _physics_process(_delta):
	Elevator.position = Elevator.position.linear_interpolate(follow,0.075)

