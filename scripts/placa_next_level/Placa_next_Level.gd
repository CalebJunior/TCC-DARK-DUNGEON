extends Node2D
class_name Placa_NextLevel

onready var texture: Sprite = get_node("Sprite")
var velocity: Vector2
export (int) var gravity_speed


func _ready() ->void:
	pass
func _physics_process(delta: float)->void:
	gravity(delta)
	texture.animate()
	

func gravity(delta: float) ->void:
	velocity.y += delta*gravity_speed
