extends Node2D

var player = preload("res://medic.tscn").instantiate()
var pause = preload("res://pause_menu.tscn").instantiate()

@export var delete_later_bullet: PackedScene
@export var soldiers: PackedScene

func _ready():
	$SoldierSpawnTimer.start()
	add_child(player)
	player.start(Vector2(576, 324))
	$GameUI/PauseMenu.visible = false

func _process(_delta):
	pass
	
func _unhandled_input(event):
	if event.is_action('click'):
		var bullet = delete_later_bullet.instantiate()
		bullet.position = get_local_mouse_position()
		add_child(bullet)
		bullet.set_bullet_velocity(Vector2(100,100))
	#not when _unhandled_input when injured:
	if event.is_action_pressed('health'):
#missing parts
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
#broken bones
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
#gun wound
		if player.left_leg.get('attached') == true and player.left_leg.get('wound') == true:
			$GameUI/GUI/Health/Body/LeftLeg.texture = load("res://art/injuries/LeftLegShot.png")
		if player.right_leg.get('attached') == true and player.right_leg.get('wound') == true:
			$GameUI/GUI/Health/Body/RightLeg.texture = load("res://art/injuries/RightLegShot.png")
		if player.left_arm.get('wound') == true:
			$GameUI/GUI/Health/Body/LeftArm.texture = load("res://art/injuries/LeftArmShot.png")
		if player.right_arm.get('wound') == true:
			$GameUI/GUI/Health/Body/RightArm.texture = load("res://art/injuries/RightArmShot.png")
		if player.torso.get('wound') == true:
			$GameUI/GUI/Health/Body/Torso.texture = load("res://art/injuries/TorsoShot.png")
		if player.head.get('wound') == true:
			$GameUI/GUI/Health/Body/Head.texture = load("res://art/injuries/HeadShot.png")


func _on_soldier_spawn_timer_timeout():
	var soldier = soldiers.instantiate()
	soldier.friendly = 1 == (randi() % 2)
	#print(soldier.friendly)
	
	if soldier.friendly:
		var spawn_location = $SoldierPath/SoldierSpawnLocation
		spawn_location.progress_ratio = randf()
			
		
		soldier.position = spawn_location.position
		soldier.add_to_group("friendly")
		add_child(soldier)
	else:
		pass
		#DO NOT DELET it's just not implemented
		#soldier.add_to_group("enemy")
		#add_child(soldier)
		#print('aaaaa')

