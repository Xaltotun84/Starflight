extends Node

onready var player : Capitano = $Capitano
#onready var area = $Contenitore_aree_apertura_porte/Porta_equi.position
onready var animated : Anime = $Contenitore_fade/Fade/ColorFade/AnimationPlayer
onready var coll : RayCast2D = $Capitano/CollisionShape2D/RayCast2D

func _ready():
	ritorno()
	andata()

func _process(delta):
	pass

func porta():
	animated.play("Porta_lab")

func ritorno():
	#da sistemare
	if Globali.porta == 1:
		animated.play("Fade_out")
		player.position = Globali.area_lab - Vector2(0, +9.5)
		print(player.position , Globali.area_lab , Globali.porta)
		print()
		yield(animated, "animation_finished")

	if Globali.porta_equi == 1:
		animated.play("Fade_out")
		player.position = Globali.area_equi - Vector2(0, +9.5)
		yield(animated, "animation_finished")

func andata():
	#da sistemare
	if player.collision_mask == 4 && coll.collide_with_areas:
		animated.play("Fade_in")
		#player.position == 
		print("ho colpito qualcosa")
		yield(animated, "animation_finished")
		if Input.is_action_just_pressed("ui_page_down"):
			Globali.porta = 1

	if player.collision_mask == 4:
		animated.play("Fade_in")
		#player.position == 
		print("ho colpito qualcosa")
		yield(animated, "animation_finished")
