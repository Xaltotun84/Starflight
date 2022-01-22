extends Control

var FILE_PATH = "res://Save/Config.cfg"
var _funzioni = ConfigFile.new()
var err

func _ready() -> void:
	_process(true)

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		pass


func _on_Capitano_S_menu():
	$Popup.show()

func _on_Riprendere_pressed():
	$Popup.hide()

func _on_Salva_pressed():
	pass # Replace with function body.
	
func _on_Carica_pressed() -> void:
	print("ciao")

func _on_Opzioni_pressed() -> void:
	#OS.shell_open("http://www.google.it")
	pass # Replace with function body.

#da aggiungere alla pagina opzioni
#func _on_CheckBox_pressed():
#	$UISound.play()
#	OS.window_fullscreen = !OS.window_fullscreen

func _on_Esci_toggled(button_pressed):
	if button_pressed == true:
		$Popup/VBoxContainer3/Esci/VBoxContainer3.show()
	elif button_pressed == false:
		$Popup/VBoxContainer3/Esci/VBoxContainer3.hide()

func _on_Esci_dal_gioco_pressed():
	get_tree().quit()

func _on_Menu_principale_pressed():
	get_tree().change_scene("res://Scene/Menu/Main_Menu.tscn")
	pass





