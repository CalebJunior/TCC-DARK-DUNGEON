extends Node2D
class_name Moeda

onready var texture: Sprite = get_node("Sprite")
var velocity: Vector2
export (int) var gravity_speed
onready var dead : bool = false

func _physics_process(delta: float)->void:
	gravity(delta)
	texture.animate()
	

func gravity(delta: float) ->void:
	velocity.y += delta*gravity_speed

func liberar_moeda()-> void:
	set_physics_process(false)
	queue_free()
