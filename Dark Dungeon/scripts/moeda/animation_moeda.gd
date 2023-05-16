extends Sprite

class_name MoedaSprite

export (NodePath) onready var moeda = get_node(moeda) as Node2D
export (NodePath) onready var animation = get_node(animation) as AnimationPlayer 
export (NodePath) onready var collision_area = get_node(collision_area) as Area2D 

func animate () -> void:
	if moeda.dead:
		animation.play("dead")
	else:
		animation.play("idle")


func on_Animation_animation_finished(anim_name):
	match anim_name:
		"dead":
			moeda.liberar_moeda()
#
