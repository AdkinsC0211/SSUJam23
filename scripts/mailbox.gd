extends Node2D

@export var boxImage: CompressedTexture2D

var in_a_box = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(self.get_name() + " is ready")
	var texture = get_node("Area2D/box_texture")
	texture.texture = boxImage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if in_a_box:
		if Input.is_action_just_pressed("right_mouse"):
			print("fuck in " + self.get_name())




func _on_area_2d_mouse_entered():
	in_a_box = true

func _on_area_2d_mouse_exited():
	in_a_box = false
