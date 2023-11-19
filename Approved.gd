extends Node2D

signal mouse_released

var picked_up: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_pressed("RMB"):
		mouse_released.emit()
		picked_up = false



func _on_button_pressed():
	picked_up = true
	await mouse_released

