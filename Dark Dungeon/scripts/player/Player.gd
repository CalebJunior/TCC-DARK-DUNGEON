extends KinematicBody2D
class_name Player

onready var player_sprite: Sprite = get_node("Texture") ## referencia o fiho de pulo
onready var stats: Node = get_node("Stats")
var velocity : Vector2

#contador de pulos
var jump_count :int = 0


#variaveis de status
var dead: bool = false
var on_hit:bool = false
var landing : bool = false
var attacking : bool = false
var defending: bool = false
var crouching: bool = false

var can_track_input : bool = true


#variaveis export
export(int) var player_gravity
export(int) var speed
export (int) var jump_speed



##esta processando toda a movimentação do jogo 
func _physics_process(delta: float):
	if not on_hit:
		action_env()

	horizontal_movement_env()
	vertical_movement_env()

	gravity(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	player_sprite.animate(velocity)

	


func horizontal_movement_env() -> void:
	var input_direction : float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if can_track_input == false or attacking:
		velocity.x=0
		return
	
	velocity.x = input_direction * speed
	
	
func vertical_movement_env() -> void:
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_just_pressed("ui_select") and jump_count < 2 and can_track_input and not attacking:
		jump_count+=1
		velocity.y = jump_speed
		
func action_env() -> void :
		attack()
		crouch()
		defense()
	
func attack () -> void:
	var attack_condition: bool = not attacking and not crouching and not defending
	if Input.is_action_just_pressed("attack") and attack_condition and is_on_floor():
		attacking = true
		player_sprite.normal_attack = true
	elif not attacking:
		attacking = false
		can_track_input = true
		player_sprite.normal_attack = true

func crouch () -> void:
	if Input.is_action_pressed("crouch") and is_on_floor() and not defending:
		crouching = true
		can_track_input = false
		stats.shielding = false
	elif not defending:
		crouching = false
		can_track_input = true 
		player_sprite.crouching_off = true
		stats.shielding = false
	

func defense () -> void:
	if Input.is_action_pressed("defense") and is_on_floor() and not crouching:
		defending = true
		can_track_input = false
		stats.shielding = true
	elif not crouching:
		defending = false
		can_track_input = true
		player_sprite.shield_off = true
		stats.shielding = false

func gravity(delta: float) -> void:
	velocity.y += delta * player_gravity
	if velocity.y >= player_gravity:
		velocity.y = player_gravity
		
func _exit_tree() -> void:
	if dead == true:
		return
	data_management.data_dictionary.player_position = global_position 
	data_management.save_data()

