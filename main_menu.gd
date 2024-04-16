extends Control

var game_1 = preload("res://game_1.tscn")

func _ready():
	pass

func _process(_delta):
	pass

func _on_quit_game_pressed():
	get_tree().quit()

func _on_start_game_1_pressed():
	get_tree().change_scene_to_packed(game_1)
	#queue_free()
	
