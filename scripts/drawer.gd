extends Node2D

@export var back_texture: CompressedTexture2D #= preload("res://ui_elements/right_top_open_back.png")
@export var front_texture: CompressedTexture2D #= preload("res://ui_elements/right_top_open_front.png")

var back_section
var front_section
var drawer_paper_manager 
var lawpaper
var notepaper
var logpaper

# Called when the node enters the scene tree for the first time.
func _ready():
	back_section = $back_section
	front_section = $front_section
	#drawer_paper_manager = $drawer_papers
	#call_deferred("load_textures")
	back_section.texture = back_texture
	front_section.texture = front_texture
	lawpaper = $/root/desk_root/book_manager/lawpaper
	notepaper = $/root/desk_root/book_manager/notepaper
#	logpaper = $/root/desk_root/book_manager/logpaper

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_drawer_button_pressed():
	self.visible = false

	$"/root/Singleton".play_sound("drawer close")

	if self.get_name() == "bot_right_drawer":
		$"/root/Singleton".play_sound("dragon chirp")
		get_node("dragon_pose1").visible = false
		get_node("dragon_pose2").visible = false
		get_node("dragon_pose3").visible = false

	
func load_textures():
	back_texture = back_section.texture
	front_texture = front_section.texture


	
func _on_laws_book_pressed():
	lawpaper.visible = true
	$"/root/Singleton".play_sound("book up")
	
func _on_logs_book_pressed():
	#logpaper.visible = true
	pass


func _on_note_book_pressed():
	$"/root/Singleton".play_sound("book up")
	notepaper.visible = true
