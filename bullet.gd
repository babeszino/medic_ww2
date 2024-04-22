extends RigidBody2D


var speed = 1500
var velocity: Vector2: set = set_bullet_velocity #Vector2(500, 500)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		#var collision_point = collision_info.get_position()
		var collided_with = collision_info.get_collider()#.get_groups()
		#print('collide_at: ', collided_with)
		
		if collided_with.get_groups().has(&"player"):
			collided_with.player_hit()
			queue_free()
		if collided_with.get_groups().has(&"soldiers"):
			collided_with.soldier_hit()
			queue_free()
		if collided_with.get_groups().has(&"walls"):
			print('wall')
			queue_free()
			
	if position.x *signf(position.x) >=3000 or position.y *signf(position.y) >= 3000:
		queue_free()
		
func set_bullet_velocity(where: Vector2):
	velocity = where


