extends Node

var main_menu

func _ready():
	main_menu = preload("res://main_menu.tscn").instantiate()
	add_child(main_menu)
func _process(_delta):
	pass
