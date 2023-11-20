extends Node2D
func _ready():
	$"/root/Singleton".play_sound("good boy")

func _on_button_pressed():
	get_tree().quit()
