extends Area2D




func _on_Dialogo1_area_entered(area):
		if area.get_parent() is Player:
			var new_dialog = Dialogic.start('Inicio_fase2')
			add_child(new_dialog)
