extends Area2D

@export var paper_texture: CompressedTexture2D = preload("res://ui_elements/paper.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_name() + " is ready") # Replace with function body.
	get_node("paper_visual").texture = paper_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
