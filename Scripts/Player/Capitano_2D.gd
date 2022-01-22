extends KinematicBody2D
class_name Capitano

signal S_menu

var velocity = Vector2.ZERO
onready var collision : RayCast2D = $CollisionShape2D/RayCast2D

#var FILE_PATH = "res://Save/Config.cfg"
var _nome = ConfigFile.new()

func _ready():
	_nome.load(Salva.FILE_PATH)
	_physics_process(true)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("S_menu")
		print(str(_nome.get_value("Generale", "CapitanoName")))

	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
	else:
		velocity = Vector2.ZERO

	var movement = 250*velocity.normalized()*_delta
	
	self.move_and_collide(movement)
	self.updateAnimatedSprite()

func updateAnimatedSprite():
	if velocity.x == -1:
		$AnimatedSprite.play("Walk_sx")
		collision.rotation_degrees = 0
	elif velocity.x == 1:
		$AnimatedSprite.play("Walk_dx")
		collision.rotation_degrees = 180
	elif velocity.y == -1:
		$AnimatedSprite.play("Walk_up")
		collision.rotation_degrees = 90
	elif velocity.y == 1:
		$AnimatedSprite.play("Walk_down")
		collision.rotation_degrees = 270

	if velocity == Vector2.ZERO:
		if $AnimatedSprite.animation == "Walk_sx":
			$AnimatedSprite.play("Fermo_sx")
		elif $AnimatedSprite.animation == "Walk_dx":
			$AnimatedSprite.play("Fermo_dx")
		elif $AnimatedSprite.animation == "Walk_up":
			$AnimatedSprite.play("Fermo_up")
		elif $AnimatedSprite.animation == "Walk_down":
			$AnimatedSprite.play("Fermo_down")
