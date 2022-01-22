extends Control

onready var nome_panel = $Panel
onready var razza_panel = $Panel/Scelta_razza/Panel

export(Resource) var Equi_T1

var p = false
var titolo

func _ready():
	#file congfigurazione
	Salva.config = getConfigFile()
	setSceneValueFromConfig(Salva.config)

	Globali.porta_equi = 0
	nome_panel.hide()
	razza_panel.hide()

#funzioni per scrittura e lettura file congfigurazione
func getConfigFile():
	var confFile = ConfigFile.new()
	confFile.load(Salva.FILE_PATH)
	return confFile
	
func setSceneValueFromConfig(config: ConfigFile):
	$Panel/ReferenceRect2/Testo2/LineEdit.text = str(config.get_value("Equipaggio", "Tab1", ""))

func _on_LineEdit_text_entered(_nome : String) -> void:
	if _nome == "" && Input.is_action_just_pressed("ui_accept"):
		$Panel/Popup.show()
	elif _nome.length() && Input.is_action_just_pressed("ui_accept"):
			Salva.config.set_value("Equipaggio", "Tab1", $Panel/ReferenceRect2/Testo2/LineEdit.text)
			Salva.config.save(Salva.FILE_PATH)
			razza_panel.show()
			$Panel/ReferenceRect2/Testo2/LineEdit.clear()

func _process(_delta):
	update_input()

func update_input():
	if p == true && Input.is_action_just_pressed("ui_cancel"):
		nome_panel.hide()

func _on_Aggiungi_pressed():
	p = true
	$Panel/ReferenceRect2/Testo2/LineEdit.grab_focus()
	nome_panel.show()
	update_input()

func _on_Esci_pressed() -> void:
	if nome_panel == show() or razza_panel == show():
		$Esci.hide()
	else:
		Globali.porta_equi = 1
		get_tree().change_scene("res://Scene/Spazioporto/Spazio_porto.tscn")

func _on_Timer_timeout() -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$Panel/Popup.hide()
	else:
		$Panel/Popup.hide()

func _on_Umani_pressed():
	Equi_T1 = load("res://Resource/Spazioporto/Equipaggio/Umani.tres")
	print("dovrei aver caricato i dati degli umani")
	nome_panel.hide()
	razza_panel.hide()
