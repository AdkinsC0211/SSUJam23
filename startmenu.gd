extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	pass
	#get_tree().change_scene_to_file("res://desk.tscn")


func _on_credits_pressed():
	$"/root/Singleton".play_sound("ui click")
	get_tree().change_scene_to_file("res://credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
