extends Node2D

#var que l'on peut personnaliser
export var _scale = Vector2(2.5, 0.15) #taille de notre plateform
export var couleur_crossable=1 #couleur de la plateforme (1=noir,2=rouge,3=bleu)

onready var cs=get_node("StaticPlateforme/CollisionPlateforme")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(_scale)
	if (couleur_crossable==1) :
		$StaticPlateforme/Color.color= Color(0, 0, 0, 1) #black
		$StaticPlateforme/Color2.color= Color(0, 0, 0, 1) #black
		$StaticPlateforme/Color3.color= Color(0, 0, 0, 1) #black
	elif (couleur_crossable==2) :
		$StaticPlateforme/Color.color= Color(1, 0, 0, 1) #red
		$StaticPlateforme/Color2.color= Color(1, 0, 0, 1) #red
		$StaticPlateforme/Color3.color= Color(1, 0, 0, 1) #red
	elif (couleur_crossable==3) :
		$StaticPlateforme/Color.color= Color(0, 0, 1, 1) #blue
		$StaticPlateforme/Color2.color= Color(0, 0, 1, 1) #blue
		$StaticPlateforme/Color3.color= Color(0, 0, 1, 1) #blue

func _on_AreaCrossable_body_entered(body):
	print(body)
	if body is Player and body.get_node("PlayerColor").color==$StaticPlateforme/Color.color:
		cs.set_deferred("disabled",true)
	if body is Player and body.get_node("PlayerColor").color!=$StaticPlateforme/Color.color:
		cs.set_deferred("disabled",false)
