extends Node2D
class_name Level

onready var player:KinematicBody2D = get_node("Player")
onready var stats: Node = get_node("Player/Stats")


func _ready() -> void:
	var _game_over:bool = player.get_node("Texture").connect("game_over",self,"on_game_over")
	data_management.load_data()
	player.global_position =  data_management.data_dictionary.player_position
	stats.moeda = data_management.data_dictionary.moedas
	stats.moedas_pegas = data_management.data_dictionary.moedas_pegas
	
func on_game_over()->void:
	data_management.data_dictionary.player_position = data_management.initial_position
	data_management.data_dictionary.moedas = data_management.moedas
	data_management.data_dictionary.moedas_pegas = []
	data_management.save_data()

	
	var _reload:bool = get_tree().reload_current_scene()
	
	
func _process(_delta):
	print(stats.moeda)
	if stats.moeda == 10:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/management/level_final.tscn")
	pass
	

