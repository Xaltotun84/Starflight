extends Area2D

export(PackedScene) var scene_to_load
signal porta()

var player

func _on_Porta_body_entered(body):
	if body.name == "Capitano":
		player = body
		emit_signal("porta")
		_scena()

func _scena():
	if player:
		if scene_to_load == null:
				print("È in allestimento")
		else:
			get_tree().change_scene_to(scene_to_load)
