extends EnemyTexture
class_name Eye_texture

export (NodePath) onready var collision_area = get_node(collision_area) as Area2D 
export (NodePath) onready var enemy_attack_area = get_node(enemy_attack_area) as Area2D 

func animate (velocity: Vector2) -> void:
	if enemy.can_hit or enemy.can_die or enemy.can_attack:
		action_behavior()
	else:
		move_behavior(velocity)
	

func action_behavior () -> void:
	if enemy.can_die:
		animation.play("dead")
		enemy.can_hit = false
		enemy.can_attack = false
		
	elif enemy.can_hit:
		animation.play("hit")
		enemy.can_attack = false
		
	elif enemy.can_attack:
		animation.play("attack")

func move_behavior(velocity: Vector2) -> void:
	if velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
		
		
func _on_animation_finished(anim_name: String) -> void:
	match anim_name:
		"hit":
			enemy.can_hit = false
			enemy.set_physics_process(true)
			
			
		"dead":
			enemy.kill_enemy()
			
		"kill":
			get_tree().call_group("stats","update_health","Increase",enemy_attack_area.damage)
			enemy.queue_free()
			
		
		"attack":
			enemy.can_attack = false
			
