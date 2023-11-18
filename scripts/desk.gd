extends TextureRect

@export var deskTexture: CompressedTexture2D = preload("res://ui_elements/desk_top.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = deskTexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
