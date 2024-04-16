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
	
func _unhandled_input(event):
	#not when _unhandled_input when injured:
	if event.is_action_pressed('health'):
		if player.left_leg.get('attached') == false and player.right_leg.get('attached') == false:
			$GameUI/GUI/Health/Body.texture = load("res://art/injuries/BodyBothLegOff.png")
			$GameUI/GUI/Health/Skeleton/LeftLeg.texture = load("res://art/Injuries/LeftLegBonesBothLegOff.png")
			$GameUI/GUI/Health/Skeleton/RightLeg.texture = load("res://art/injuries/RightLegBonesBothLegOff.png")
		elif player.left_leg.get('attached') == false:
			$GameUI/GUI/Health/Body.texture = load("res://art/injuries/BodyLeftLegOff.png")
			$GameUI/GUI/Health/Skeleton/LeftLeg.texture = load("res://art/Injuries/LeftLegBonesLeftLegOff.png")
		elif player.right_leg.get('attached') == false:
			$GameUI/GUI/Health/Body.texture = load("res://art/injuries/BodyRightLegOff.png")
			$GameUI/GUI/Health/Skeleton/RightLeg.texture = load("res://art/injuries/RightLegBonesRightLegOff.png")
		if player.left_leg.get('attached') == true and player.left_leg.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/LeftLeg.texture = load("res://art/injuries/LeftLegBonesBroken.png")
		if player.right_leg.get('attached') == true and player.right_leg.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/RightLeg.texture = load("res://art/injuries/RightLegBonesBroken.png")
		if player.left_arm.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/LeftArm.texture = load("res://art/injuries/LeftArmBonesBroken.png")
		if player.right_arm.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/RightArm.texture = load("res://art/injuries/RightArmBonesBroken.png")
		if player.torso.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/Torso.texture = load("res://art/injuries/TorsoBonesBroken.png")
		if player.head.get('bone') <= 0:
			$GameUI/GUI/Health/Skeleton/Head.texture = load("res://art/injuries/SkullBroken.png")
