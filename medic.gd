extends CharacterBody2D

var speed = 300.0
var target_position = position

#var movement_lock = false

var blood = 100
var mental_health = 100
var helmet_is_on = true
var head = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var torso = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var left_arm = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var right_arm = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var left_leg = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var right_leg = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': false}


func _physics_process(delta):
	var direction = target_position - position

	if direction.length() > speed * delta:
		direction = direction.normalized() * speed
	else:
		direction = target_position - position

	position += direction * delta

	print("Direction: ", direction)


func start(pos):
	position = pos
	#$CollisionShape2D.disabled = false

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_action_pressed("go_to"):
		target_position = event.position
		print("Mouse clicked at: ", event.position)
