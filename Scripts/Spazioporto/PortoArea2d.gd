extends Area2D

signal player_entered(global_position)
signal animat_CD() #CHIUSURA PORTA

func _on_Porto_body_entered(body):
	if body.name == "Capitano":
		emit_signal("player_entered", global_position.x)

func _on_Porto_body_exited(_body):
	emit_signal("animat_CD")
