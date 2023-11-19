extends Node2D

var lawpaper
# Called when the node enters the scene tree for the first time.
func _ready():
	lawpaper = $/root/desk_root/book_manager/lawpaper


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("GoBack"):
		get_tree().change_scene_to_file("res://scenes/desk.tscn")


func _on_button_pressed():
	lawpaper.visible = false
