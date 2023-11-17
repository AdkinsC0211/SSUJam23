extends TextureButton

@export var paper_texture: CompressedTexture2D = preload("res://ui_elements/paper.png")

var grab_offset:Vector2 = Vector2(0,0)
var held = false
var parent
var desk_paper_manager
var layer = 0

signal layer_update

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture_normal = paper_texture 
	parent = self.get_parent()
	desk_paper_manager = $/root/desk_root/paper_manager
	desk_paper_manager.connect("update_paper_order",update_paper_order)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if held:
		global_position = get_global_mouse_position() - grab_offset



func update_paper_order():
	for child in parent.get_children():
		if child.held == true:
			child.layer = 0
		else:
			child.layer -= 1

func _on_pressed():
	held = !held
	layer_update.emit()
	if held:
		grab_offset.x = get_global_mouse_position().x - self.global_position.x
		grab_offset.y = get_global_mouse_position().y - self.global_position.y
	


func _on_mouse_entered():
	self.scale.x = .4
	self.scale.y = .4


func _on_mouse_exited():
	self.scale.x = .35
	self.scale.y = .35
