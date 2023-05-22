extends Node2D

func _ready():
	var screen_size = OS.get_window_size()
	$Sprite.scale = screen_size / $Sprite.texture.get_size()
