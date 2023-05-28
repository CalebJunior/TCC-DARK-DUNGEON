extends Area2D
class_name Area_Collision_Dano



func _on_dano_title_area_entered(area):
	if area.get_parent() is Player:
		var player_stats: Node = area.get_parent().get_node("Stats")
		player_stats.update_health("Decrease",1000)
