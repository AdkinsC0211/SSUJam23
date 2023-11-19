extends Node2D

var logpaper
# Called when the node enters the scene tree for the first time.
func _ready():
	logpaper = $/root/desk_root/book_manager/logpaper


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	logpaper.visible = false
