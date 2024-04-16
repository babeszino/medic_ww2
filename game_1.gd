extends Node2D

var player = preload("res://medic.tscn").instantiate()
var pause = preload("res://pause_menu.tscn").instantiate()

func _ready():
	add_child(player)
	player.start($Marker2D.position)
	$GameUI/PauseMenu.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta):
	pass
