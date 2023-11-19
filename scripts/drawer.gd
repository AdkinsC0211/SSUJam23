extends Node2D

@export var back_texture: CompressedTexture2D #= preload("res://ui_elements/right_top_open_back.png")
@export var front_texture: CompressedTexture2D #= preload("res://ui_elements/right_top_open_front.png")

var back_section
var front_section
var drawer_paper_manager 

# Called when the node enters the scene tree for the first time.
func _ready():
	back_section = $back_section
	front_section = $front_section
	drawer_paper_manager = $drawer_papers
	
	#call_deferred("load_textures")
	back_section.texture = back_texture
	front_section.texture = front_texture
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_drawer_button_pressed():
	self.visible = false
	
func load_textures():
	back_texture = back_section.texture
	front_texture = front_section.texture