extends Sprite2D


#func _input(event):
#	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
#		if get_viewport_rect().has_point(to_local(event.position)):
#			get_tree().change_scene_to_file("res://lawpaper.tscn")
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://lawpaper.tscn")
