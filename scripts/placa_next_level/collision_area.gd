extends Area2D
class_name CollisionAreaPlaca

func on_collision_area_entered(area):
	print(get_tree().get_current_scene().get_path())
	if area.get_parent() is Player and get_tree().get_current_scene().get_path() == '/root/Level':
		get_tree().call_group("level_1","passar_fase")
	elif area.get_parent() is Player and get_tree().get_current_scene().get_path() == '/root/Level_final':
		get_tree().call_group("level_final","passar_fase")
