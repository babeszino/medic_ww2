extends CharacterBody2D


const SPEED = 150.0

var movement_lock = false

var blood = 100
var mental_health = 100
var helmet_is_on = true
var head = {'flesh': 100, 'bone': 100, 'wound': false}
var torso = {'flesh': 100, 'bone': 100, 'wound': false}
var left_arm = {'flesh': 100, 'bone': 100, 'wound': false}
var right_arm = {'flesh': 100, 'bone': 100, 'wound': false}
var left_leg = {'flesh': 100, 'bone': 100, 'wound': false}
var right_leg = {'flesh': 100, 'bone': 100, 'wound': false}


func _physics_process(delta):

	velocity = Vector2.ZERO
	if Input.is_action_pressed("go_right"):
		velocity.x += 1
	if Input.is_action_pressed("go_left"):
		velocity.x -= 1
	if Input.is_action_pressed("go_down"):
		velocity.y += 1
	if Input.is_action_pressed("go_up"):
		velocity.y -= 1


	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED

	position += velocity * delta
	move_and_slide()

func start(pos):
	position = pos
	#$CollisionShape2D.disabled = false
