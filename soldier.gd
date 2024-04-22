extends CharacterBody2D

@export var bullets: PackedScene

const speed = 15.0

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

func _ready():
	_move()
	$DirChange.start()
	$CHANGE_TIMER_FOR_ENEMY_DETECTION.start()

func _physics_process(delta):
	if velocity.length() > 0:
		velocity = velocity.normalized()
	
	velocity *= speed
	if position.x *signf(position.x) >=3000 or position.y *signf(position.y) >= 3000: #For rouge soldiers who are out of bounds: REMOVE ASAP
		queue_free()
	move_and_slide()

func _move():
	while velocity == Vector2(0,0):
		velocity.x = randi_range(-1,1)
		velocity.y = randi_range(-1,1)

#BROKEN
func _on_change_timer_for_enemy_detection_timeout():
	print("bullets ar flying")
	var bullet = bullets.instantiate()
	bullet.position = self.position
	add_child(bullet)
	bullet.set_bullet_velocity(Vector2(30,30))


func soldier_hit():
	print('soldier id: ', get_instance_id())

