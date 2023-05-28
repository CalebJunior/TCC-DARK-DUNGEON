extends Node

var save_path: String = "user://save.dat"
var initial_position: Vector2 = Vector2(17,142)
var moedas : int = 0
var moedas_pegas = []
var current_scene: String = '/root/Level'
var data_dictionary: Dictionary ={
	"player_position": initial_position,
	"current_scene": current_scene,
	"moedas": moedas,
	"moedas_pegas":moedas_pegas
}


func save_data () -> void:
	var file: File = File.new()
	var error = file.open(save_path,File.WRITE)
	if error == OK:
		file.store_var(data_dictionary)
		file.close()
		
		
func load_data() -> void: 
	var file: File = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path,File.READ)
		print(error)
		if error == OK:
			data_dictionary = file.get_var()
			file.close()
			
func delete_save() -> void:
	var dir = Directory.new()
	if dir.file_exists(save_path):
		var error = dir.remove(save_path)
		if error == OK:
			print("Save file deleted.")
		else:
			print("Failed to delete save file, error code: ", error)
	else:
		print("No save file found.")
