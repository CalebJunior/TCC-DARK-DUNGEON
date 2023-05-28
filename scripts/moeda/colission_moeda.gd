extends Area2D
class_name Area_Collision_Moeda
export (NodePath) onready var moeda = get_node(moeda) as Node2D

func on_collision_area_area_entered(area):
	print(area)
	if area.get_parent() is Player:
		var player_stats: Node = area.get_parent().get_node("Stats")
		player_stats.update_moeda(moeda.moeda)
		moeda.dead = true
