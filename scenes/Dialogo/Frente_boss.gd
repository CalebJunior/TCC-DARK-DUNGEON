extends Area2D




func _on_Dialogo1_area_entered(area):
		if area.get_parent() is Player:
			var new_dialog = Dialogic.start('Frente_boss')
			add_child(new_dialog)
