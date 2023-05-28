extends Sprite
export (NodePath) onready var animation = get_node(animation) as AnimationPlayer 
class_name Sprite_Portal

func animate () -> void:
		animation.play("idle")
