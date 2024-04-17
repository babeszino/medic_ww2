extends CharacterBody2D

# egyelore clamp-eltem, hogy csak a viewport szeleig lehessen menni, 
# de majd kiszedhetjuk

var speed = 300.0
var sprint_speed = 450.0
var screen_size
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


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO
	var current_speed = speed
	
	if Input.is_action_pressed("go_up"):
		velocity.y -= 1
	if Input.is_action_pressed("go_down"):
		velocity.y += 1
	if Input.is_action_pressed("go_left"):
		velocity.x -= 1
	if Input.is_action_pressed("go_right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized()
		
		if Input.is_action_pressed("sprint"):
			current_speed = sprint_speed
		
		velocity *= current_speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func start(pos):
	position = pos
	#$CollisionShape2D.disabled = false
