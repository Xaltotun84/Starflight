extends TabContainer

#onready var label : LineEdit = get_node("Tabs")
onready var _tabs_num : int = get_tab_count() - 1

var input : Dictionary = {}

#var FILE_PATH = "res://Save/Config.cfg"
#var config
var _nome = ConfigFile.new()

func _ready():
	_nome.load(Salva.FILE_PATH)

	for i in range(get_child_count()):
		set_tab_title(i, "")

func _process(_delta):
	_update_input()
	_move_between_tabs()
	_change_name()

func _update_input():
	input = {
		moveLR = int(Input.is_action_just_pressed("ui_right")) - int(Input.is_action_just_pressed("ui_left")),
		change = int(Input.is_action_just_pressed("ui_accept")) 
	}

func _move_between_tabs():
	var _limit = current_tab + input.moveLR
	if _limit < 0 or _limit > _tabs_num:
		return
	else:
		current_tab += input.moveLR

func _change_name():
	if input.change:
		var _label_name : String = str(_nome.get_value("Equipaggio", "Tab1"))#get_child(current_tab).get_node("Label").text
		set_tab_title(current_tab, _label_name)
		
