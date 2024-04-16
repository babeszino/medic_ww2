extends Control



var body_visible: bool = false: set = set_body_visible
var skeleton_visible: bool = false: set = set_skeleton_visible

func _ready():
	body_visible = false
	var body_shots = $Health/Body.get_children()
	for i in body_shots:
		i.visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed('health'):
		self.body_visible = !body_visible
		self.skeleton_visible = false
	if event.is_action_pressed('bone_health') and body_visible == true:
		self.skeleton_visible = !skeleton_visible
		

func set_body_visible(value):
	body_visible = value
	$Health.visible = body_visible
	set_process_input(body_visible)

func  set_skeleton_visible(value):
	skeleton_visible = value
	$Health/Skeleton.visible = skeleton_visible
	set_process_input(skeleton_visible)

	
