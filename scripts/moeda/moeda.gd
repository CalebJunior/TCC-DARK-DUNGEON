extends Node2D
class_name Moeda

onready var texture: Sprite = get_node("Sprite")
var velocity: Vector2
export (int) var gravity_speed
onready var dead : bool = false
onready var moeda : String
onready var moedas_pegas = []

func _ready() ->void:
	if global_position == Vector2(644,56):
		moeda = '1'
	elif global_position == Vector2(2010,147):
		moeda = '2'
	elif global_position == Vector2(-206,523):
		moeda = '3'
	elif global_position == Vector2(430,809):
		moeda = '4'
	elif global_position == Vector2(81,1497):
		moeda = '5'
	elif global_position == Vector2(1071,1203):
		moeda = '6'
	elif global_position == Vector2(2608,1742):
		moeda = '7'
	elif global_position == Vector2(6099,1032):
		moeda = '8'
	elif global_position == Vector2(8341,148):
		moeda = '9'
	elif global_position == Vector2(5721,176):
		moeda = '10'
		
	
	
func _physics_process(delta: float)->void:
	moedas_pegas = data_management.data_dictionary.moedas_pegas.duplicate(true)
	for nome_moeda in moedas_pegas:
		if moeda == nome_moeda:
			liberar_moeda()
		
	gravity(delta)
	texture.animate()
	

func gravity(delta: float) ->void:
	velocity.y += delta*gravity_speed

func liberar_moeda()-> void:
	set_physics_process(false)
	queue_free()
	
