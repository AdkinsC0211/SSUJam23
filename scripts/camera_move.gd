extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("camera_down") and global_position.y <= 660:
		self.global_position.y += 350 * delta
	if Input.is_action_pressed("camera_up") and global_position.y >= 330:
		self.global_position.y -= 350 * delta
