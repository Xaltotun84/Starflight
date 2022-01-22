extends Control
class_name GUI

onready var edit_x = $Gui_Navigazione/Edit_X
onready var edit_y = $Gui_Navigazione/Edit_Y
onready var pos_x_label : Label = $Gui_Navigazione/Pos_X as Label
onready var pos_y_label : Label = $Gui_Navigazione/Pos_Y as Label

onready var Scienziato : Button = $Gui_Generale/Scienziato as Button
onready var Ingegnere : Button = $Gui_Generale/Ingenere as Button
onready var Combattimento : Button = $Gui_Generale/Combattimento as Button
onready var Comunicazioni : Button = $Gui_Generale/Comunicazioni as Button
onready var Scan_Sistema : Button = $Gui_Generale/Scan_Sistema as Button
onready var Scan_Pianeta : Button = $Gui_Generale/Scan_Pianeta as Button
onready var animate_Item : AnimationPlayer = $AnimationPlayer as AnimationPlayer

#onready var coord : ReferenceRect = $ReferenceRect is ReferenceRect
onready var coord_text = false
onready var menu_gen = false

signal accettazione()

func _ready():
	set_process(true)

#funzioni che identifica i tasti che vengono premuti per i menu rapidi
#o del menu ufficiali con i loro comandi
func _process(_delta):
	if Input.is_action_just_pressed("ui_coordinate") && coord_text == false:
		coord_text = true
		$Gui_Navigazione.show()
		coordinate()
	elif Input.is_action_just_pressed("ui_coordinate") && coord_text == true:
		coord_text = false
		$Gui_Navigazione.hide()
	elif Input.is_action_just_pressed("ui_menu") && menu_gen == false:
		menu_gen = true
		$Gui_Generale.show()
	elif Input.is_action_just_pressed("ui_menu") && menu_gen == true:
		$Gui_Generale/Menu.text = str("MENU")
		menu_gen = false
		$Gui_Generale.hide()

#funzione che dovrebbe servire a prendere i valori dalle caselle edit
#e spedirli al player per poi eseguire i movimenti
func coordinate():
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("accettazione", edit_x, edit_y)

#funzioni che permette la visualizzazione dell'asse X e Y in cui si 
#trova il player
func _on_Nave_pos_x(direzione) -> void:
	pos_x_label.text = str(direzione)
func _on_Nave_pos_y(direzione) -> void:
	pos_y_label.text = str(direzione)

func _on_Ingenere_pressed():
	print("Non è ancora pronto")


func _on_Combattimento_pressed():
	print("Non è ancora pronto")
