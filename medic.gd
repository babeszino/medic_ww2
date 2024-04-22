extends CharacterBody2D

# egyelore clamp-eltem, hogy csak a viewport szeleig lehessen menni, 
# de majd kiszedhetjuk

var speed = 150.0
var sprint_speed = 250.0
var screen_size
var movement = false

var blood = 100
var mental_health = 100
var helmet_is_on = true
var head = {'flesh': int(100), 'bone': 0, 'wound': false, 'attached': true}
var torso = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var left_arm = {'flesh': 100, 'bone': 0, 'wound': true, 'attached': true}
var right_arm = {'flesh': 100, 'bone': 0, 'wound': false, 'attached': true}
var left_leg = {'flesh': 100, 'bone': 0, 'wound': true, 'attached': false}
var right_leg = {'flesh': 100, 'bone': 0, 'wound': true, 'attached': false}



func _ready():
	screen_size = get_viewport_rect().size


func _process(_delta):
	var current_speed = speed
	
	velocity.x = Input.get_axis("go_left","go_right")
	velocity.y = Input.get_axis("go_up","go_down" )
	
	if velocity.length() > 0:
		velocity = velocity.normalized()
		
		if Input.is_action_pressed("sprint"):
			current_speed = sprint_speed
		
		velocity *= current_speed

	move_and_slide()

func start(pos):
	position = pos
	#$CollisionShape2D.disabled = false
	
func player_hit():
	print('hello it s a hit')
