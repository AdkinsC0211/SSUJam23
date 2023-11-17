extends Area2D

@export var paper_texture: CompressedTexture2D = preload("res://ui_elements/paper.png")

var held: bool = false
var mouse_over: bool = false
var grab_offset: Vector2 = Vector2(0,0)
var layer: int = 0
var parent
var desk_paper_manager


signal layer_update
signal grab_paper

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = self.get_parent()
	desk_paper_manager = $/root/desk_root/paper_manager
	desk_paper_manager.connect("update_paper_order",update_paper_order)
	
	
	#print(self.get_name() + " is ready") # Replace with function body.
	get_node("paper_visual").texture = paper_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("right_mouse"):
		if mouse_over:
			if held == false:
				held = true
				layer_update.emit()
				#print("holding " + self.get_name())
				grab_offset.x = get_global_mouse_position().x - self.global_position.x
				grab_offset.y = get_global_mouse_position().y - self.global_position.y
				

			elif held == true:
				held = false

	if held:
		global_position = get_global_mouse_position() - grab_offset
		
	

func update_paper_order():
	for child in parent.get_children():
		if child.held == true:
			child.layer = 0
		else:
			child.layer -= 1
	


func _on_mouse_entered():
	#print(self.get_name() + " detected mouse")
	self.scale.x = 1.1
	self.scale.y = 1.1
	mouse_over = true

func _on_mouse_exited():
	#print(self.get_name() + " mouse left")
	self.scale.x = 1
	self.scale.y = 1
	mouse_over = false
