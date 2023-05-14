extends Control
class_name BarContainer


onready var tween: Tween = get_node("Tween")

onready var health_bar: TextureProgress = get_node("HealthBarBackgorund/HealthBar")

var current_health: int

func init_bar(health: int)  -> void:
	health_bar.max_value = health

	health_bar.value = health
	
	current_health = health

	
func update_bar(type: String, value: int) ->void:
	
	call_tween(health_bar,current_health,value)
	current_health = value
	
func call_tween(bar: TextureProgress, initial_value: int, final_value: int) -> void:
	var _interpolate_value: bool = tween.interpolate_property(
		bar,
		"value",
		initial_value,
		final_value,
		0.2,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	
	var _start: bool = tween.start()
