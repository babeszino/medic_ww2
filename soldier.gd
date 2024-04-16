extends CharacterBody2D

const SPEED = 150.0

var blood = 100
var mental_health = 100
var helmet_is_on = true
var head = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var torso = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var left_arm = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var right_arm = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var left_leg = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}
var right_leg = {'flesh': 100, 'bone': 100, 'wound': false, 'attached': true}

func _physics_process(delta):
	move_and_slide()
