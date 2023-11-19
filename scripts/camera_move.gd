extends Camera2D

var desk_paper_manager
var reading_paper: bool
var book_manager
var holding_book: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	desk_paper_manager = $/root/desk_root/paper_manager
	book_manager = $/root/desk_root/book_manager


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reading_paper = false
	holding_book = false
	for child in desk_paper_manager.get_children():
		if child.reading_mode == true:
			reading_paper = true
		
	for child in book_manager.get_children():
		if child.visible == true:
			holding_book = true
			
			
	if !reading_paper and !holding_book:
		if Input.is_action_pressed("camera_down") and global_position.y <= 660:
			self.global_position.y += 350 * delta
		if Input.is_action_pressed("camera_up") and global_position.y >= 330:
			self.global_position.y -= 350 * delta
		if Input.is_action_just_pressed("camera_up"):
			global_position.y = clampf(global_position.y - 30.0, 330.0, 660.0)
		if Input.is_action_just_pressed("camera_down"):
			global_position.y = clampf(global_position.y + 30.0, 330.0, 660.0)
