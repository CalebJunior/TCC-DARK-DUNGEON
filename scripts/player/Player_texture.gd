extends Sprite

class_name Player_texture
signal game_over

export (NodePath) onready var animation = get_node(animation) as AnimationPlayer 
export (NodePath) onready var player = get_node(player) as KinematicBody2D
export (NodePath) onready var collision_attack = get_node(collision_attack) as CollisionShape2D
var previous_state: String = ""


var normal_attack : bool = false
var shield_off : bool = false
var crouching_off : bool = false
var suffix: String = "_right"
var hit_animation_played: bool = false



func animate(direction: Vector2) -> void:
	verify_position(direction)
	if player.on_hit or player.dead:
		if not hit_animation_played:
			hit_behavior()
			hit_animation_played = true
		return
	else:
		hit_animation_played = false

	if player.attacking or player.defending or player.crouching:
		action_behavior()
	elif direction.y != 0:
		vertical_behavior(direction)
	elif player.landing == true:
		animation.play("landing")
	else:
		horizontal_behavior(direction)

	
func verify_position(direction : Vector2) -> void:
	if direction.x > 0 :
		flip_h = false
		suffix = "_right"
	elif direction.x < 0:
		flip_h = true
		suffix = "_left"
		
func hit_behavior() -> void:
	player.set_physics_process(false)
	collision_attack.set_deferred("disable", true)
	if player.dead:
		$deadsound.play()
		OS.delay_msec(150)
		$deadsound.stop()
		animation.play("dead")
		
	elif player.on_hit:
		animation.play("hit")
		
func vertical_behavior (direction : Vector2) -> void :
	if direction.y > 0 :
		player.landing = true
		animation.play("fall")
	elif direction.y < 0:
		animation.play("jump")

func horizontal_behavior (direction : Vector2) -> void :
	if direction.x != 0 :
		animation.play("run")
	else:
		animation.play("idle")


			
func action_behavior() -> void:
	if player.attacking and normal_attack:
		animation.play("attack" + suffix)
	elif player.defending and shield_off:
		animation.play("shield")
		shield_off = false
	elif player.crouching and crouching_off:
		animation.play("crouch")
		crouching_off = false
		
func on_animation_finished(anim_name) -> void:
	match anim_name:
		"landing":
			player.landing = false

		"attack_left":
			normal_attack = false
			player.attacking = false

		"attack_right":
			normal_attack = false
			player.attacking = false

		"hit":
			player.on_hit = false  
			player.set_physics_process(true)  

			if player.defending:
				animation.play("shield")

			if player.crouching:
				animation.play("crouch")

		"dead":
			emit_signal("game_over")
