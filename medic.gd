extends CharacterBody2D

var speed = 300.0
var target_position = position

var movement = false

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
	move_and_slide()

func start(pos):
	position = pos
	target_position = pos
	#$CollisionShape2D.disabled = false

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_action("go_to"):
		target_position = event.position
		movement = !movement
		print(movement)
	
	#Movement change: 
	if event is InputEventMouseMotion and movement:
		target_position = event.position
