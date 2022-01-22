extends Node

var _funzioni = ConfigFile.new()
var err

func _ready() -> void:
	err = _funzioni.load(Salva.FILE_PATH)
	if err != OK:
		print("il pulsante carica rimane disabilitato")
		return 
	else:
		print("il pulsante carica si abilita")
		$VBoxContainer3/Carica.disabled = false
	_process(true)

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		$Control.hide()

func _on_Nuova_partita_pressed() -> void:
	$Control/Panel/ReferenceRect2/Testo2/LineEdit.clear()
	$Control/Panel/ReferenceRect2/Testo2/LineEdit.grab_focus()
	$Control.show()

func _on_Carica_pressed() -> void:
	print("ciao")

func _on_Opzioni_pressed() -> void:
	#OS.shell_open("http://www.google.it")
	pass # Replace with function body.


func _on_Esci_pressed() -> void:
	get_tree().quit()

#da aggiungere alla pagina opzioni
#func _on_CheckBox_pressed():
#	$UISound.play()
#	OS.window_fullscreen = !OS.window_fullscreen


