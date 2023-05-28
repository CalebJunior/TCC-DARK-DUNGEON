extends Node2D
class_name CenaPosCredito

onready var label : Label = $Label
onready var timer : Timer = $Timer
onready var moeda: Node2D = $Moeda
export(Array) var Sequencia_texto = []

var contador : int = 0

func _ready():
	data_management.load_data()
	timer.start()

	timer.connect("timeout", self, "_on_Timer_timeout")

	if Sequencia_texto.size() > 0:
		label.text = Sequencia_texto[contador] + " "+ str(data_management.data_dictionary.moedas+10)
		
	
	

func _on_Timer_timeout():
	
	contador += 1
	if contador < Sequencia_texto.size():
		label.text = Sequencia_texto[contador]
	else:
		timer.stop()
		data_management.delete_save()
		get_tree().change_scene("res://scenes/env/initial_screen.tscn")
	if contador == 1 :
		moeda.queue_free()

