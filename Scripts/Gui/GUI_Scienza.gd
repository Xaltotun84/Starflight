extends "res://Scripts/Gui/GUI.gd"

#ESTENSIONE SCRIPT GUI MENU SCIENZA
func _on_Scienziato_pressed():
	$Gui_Generale/Menu.text = str("DATI SCIENTIFICI")
	Scienziato.hide()
	Ingegnere.hide()
	Combattimento.hide()
	Comunicazioni.show()
	Scan_Sistema.show()
	Scan_Pianeta.show()

func _on_Comunicazioni_pressed():
	pass # Replace with function body.


func _on_Scan_Sistema_pressed():
	#animate_Item.show()
	animate_Item.play("Radar")
#	_dati_sistema()
	#if animate_Item.
	#	return animate_Item
	#else:
	#	print("ci sono dei pianeti e una stella")

#func _dati_sistema():
#	if animate_Item.playing:
#		return animate_Item
#	else:
#		print("ci sono dei pianeti e una stella")
		#queue_free()

func _on_Scan_Pianeta_pressed():
	pass # Replace with function body.
