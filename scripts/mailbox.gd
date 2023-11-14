extends Node2D

@export var boxImage: CompressedTexture2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_name() + "is ready")
	var texture = get_node("Area2D/box_texture")
	texture.texture = boxImage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_mouse_entered():
	print("in this bitch: " + self.get_name()) # Replace with function body.
