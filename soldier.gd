extends CharacterBody2D

@export var bullets: PackedScene

const speed = 150.0

var friendly = true

var blood = 100
var mental_health = 100
var helmet_is_on = true
var head = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var torso = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var left_arm = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var right_arm = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var left_leg = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var right_leg = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}

var move_velocity = Vector2(0,0) #DO WE NEED THIS?

func _ready():
	_move()
	$DirChange.start()
	$CHANGE_TIMER_FOR_ENEMY_DETECTION.start()

func _physics_process(_delta):
	velocity = move_velocity
	if velocity.length() > 0:
		velocity = velocity.normalized()
	
	velocity *= speed
	
	move_and_slide()

func _move():
	while move_velocity == Vector2(0,0):
		move_velocity = Vector2(randi_range(-1,1), randi_range(-1,1))


#BROKEN
func _on_change_timer_for_enemy_detection_timeout():
	print("bullets ar flying")

	var bullet = bullets.instantiate()
	add_child(bullet)
	bullet.set_bullet_velocity(Vector2(1500,1500))



func soldier_hit():
	print('soldier id: ', get_instance_id())

