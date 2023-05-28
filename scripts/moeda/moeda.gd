extends Node2D
class_name Moeda

onready var texture: Sprite = get_node("Sprite")
var velocity: Vector2
export (int) var gravity_speed
onready var dead : bool = false
onready var moeda : String
onready var moedas_pegas = []

func _ready() ->void:
	if global_position == Vector2(661,52.000046):
		moeda = '1'
	elif global_position == Vector2(2010, 145.939545):
		moeda = '2'
	elif global_position == Vector2(-206,519.227051):
		moeda = '3'
	elif global_position == Vector2(430,803.163879):
		moeda = '4'
	elif global_position == Vector2(81,1486.200684):
		moeda = '5'
	elif global_position == Vector2(1071,1194.321533):
		moeda = '6'
	elif global_position == Vector2(2608,1729.433228):
		moeda = '7'
	elif global_position == Vector2(6099,1024.555176):
		moeda = '8'
	elif global_position == Vector2(8209,149.00029):
		moeda = '9'
	elif global_position == Vector2(5721,174.730331):
		moeda = '10'
	elif global_position == Vector2(844, 180):
		moeda = '11'
	elif global_position == Vector2(1729, 149):
		moeda = '12'
	elif global_position == Vector2(2499, 118):
		moeda = '13'
	elif global_position == Vector2(3456, 149):
		moeda = '14'
	
func _physics_process(delta: float)->void:
	moedas_pegas = data_management.data_dictionary.moedas_pegas.duplicate(true)
	for nome_moeda in moedas_pegas:
		if moeda == nome_moeda:
			queue_free()
	gravity(delta)
	texture.animate()
	

func gravity(delta: float) ->void:
	velocity.y += delta*gravity_speed

func liberar_moeda() -> void:
	set_physics_process(false)
	$Moeda_pega.play()
	OS.delay_msec(150)
	$Moeda_pega.stop()
	$Moeda_pega.connect("finished", self, "_on_Moeda_pega_finished")
	



func _on_Moeda_pega_finished():
	queue_free()
	
func kill():
	queue_free()


	
