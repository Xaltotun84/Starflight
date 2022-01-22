extends KinematicBody2D
class_name Horaison

export (String) var nome
export (Resource) var potenza_motore
export (Resource) var scafo
export (Resource) var scudi
export (Resource) var arma
export (Resource) var massa_nave

export (Resource) var ingegnere
export (Resource) var scienziato
export (Resource) var navigatore
export (Resource) var comunicazione
export (Resource) var medico

#STATISTICHE NAVE

#export (int) var massa_nave = 100
export (float) var cargo = 75.0
export (int) var consumo_carburante = -2
export (int) var sterzo = 10


#PER LA GUI
export var Scafo_nave = 100
export var Scudi_nave = 0
export var Armi_nave = ["Laser", "Cannoni", "Siluri"]

#VARIABILI PROVVISORIE PER PROVA CARICO TUTTO SOTTO PROVE DA ELIMINARE
export var oro_p = 1
var oro_c = 1

var accelerazione = Vector2.ZERO
var movimento
var rpm

onready var angolo_sterzo
var wheel_base = 7

func _ready() -> void:
	_physics_process(true)
	randomize()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	#accelerazione = Vector2.ZERO
	get_inputs(_delta)
	#calcolo_sterzo(_delta)
	#movimento = accelerazione * _delta

func get_inputs(_delta) -> void:
	#sistema movimento con sterzo
	var turn = 0
	if Input.is_action_pressed("ui_right"):
		turn += 1
		print("sterza a dx")
	if Input.is_action_pressed("ui_left"):
		turn -= 1
		print("sterza a sx")
	angolo_sterzo = turn * sterzo
	accelerazione = Vector2.ZERO
	#rpm = Motore1.potenza_motore - cargo
	if Input.is_action_pressed("ui_up"):
		accelerazione = transform.x
		print("va avanti")

#	rpm = accelerazione - cargo

#	movimento = rpm * velocity
	movimento = accelerazione * _delta
	#print("accelerazione ", accelerazione , " RPM ", rpm , " movimento ", movimento)
	movimento = move_and_slide(movimento)

func calcolo_sterzo(_delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += accelerazione * _delta
	front_wheel += accelerazione.rotated(angolo_sterzo) * _delta
	var new_heading = (front_wheel - rear_wheel).normalized()
	accelerazione = new_heading * accelerazione.length()
	rotation = new_heading.angle()

