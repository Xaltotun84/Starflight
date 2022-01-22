extends Control

var _nome

func _ready():
	Salva.config = getConfigFile()
	setSceneValueFromConfig(Salva.config)

func getConfigFile():
	var confFile = ConfigFile.new()
	confFile.load(Salva.FILE_PATH)
	return confFile

func _on_LineEdit_text_entered(_nome: String) -> void:
	if _nome == "" && Input.is_action_just_pressed("ui_accept"):
		$Panel/Popup.show()
	elif _nome.length() && Input.is_action_just_pressed("ui_accept"):
		Salva.config.set_value("Generale", "CapitanoName", $Panel/ReferenceRect2/Testo2/LineEdit.text)
		Salva.config.save(Salva.FILE_PATH)
		get_tree().change_scene("res://Scene/Spazioporto/Spazio_porto.tscn")

func setSceneValueFromConfig(config: ConfigFile):
	$Panel/ReferenceRect2/Testo2/LineEdit.text = str(config.get_value("Generale", "CapitanoName", ""))

func _on_Timer_timeout() -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$Panel/Popup.hide()
	else:
		$Panel/Popup.hide()
