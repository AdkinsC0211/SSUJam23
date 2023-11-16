extends Area2D

@export var paper_texture: CompressedTexture2D = preload("res://ui_elements/paper.png")

var held: bool = false
var mouse_over: bool = false
var grab_offset: Vector2 = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_name() + " is ready") # Replace with function body.
	get_node("paper_visual").texture = paper_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if mouse_over:
		if Input.is_action_just_pressed("right_mouse"):
			if held == false:
				#print("holding " + self.get_name())
				held = true
				grab_offset.x = get_global_mouse_position().x - self.global_position.x
				grab_offset.y = get_global_mouse_position().y - self.global_position.y
				
			elif held == true:
				#print("dropping " + self.get_name())
				held = false
	if held:
		global_position = get_global_mouse_position() - grab_offset
		



func _on_mouse_entered():
	#print(self.get_name() + " detected mouse")
	mouse_over = true

func _on_mouse_exited():
	#print(self.get_name() + " mouse left")
	mouse_over = false
