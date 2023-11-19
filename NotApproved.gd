extends Node2D

signal mouse_released

var picked_up: bool = false
var stamp = preload("res://rstamp.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_pressed("RMB") and !picked_up:
		mouse_released.emit()
		#picked_up = false
	
	if Input.is_action_just_pressed("LMB") and picked_up:
		var highest = null
		var laya = 99999999
		for i in $Area2D.get_overlapping_areas():
			if i.get_parent().get("layer") < laya:
				laya = i.get_parent().get("layer")
				highest = i.get_parent()
		if highest != null:
			var temp = stamp.instantiate()
			highest.add_child(temp)
			temp.global_transform.origin = global_transform.origin
			$"/root/Singleton".play_sound("stamp use")
			if highest.get("approved")!=null:
				highest.approved = 0


func _on_button_2_pressed():
	picked_up = !picked_up
	if picked_up:
		$"/root/Singleton".play_sound("stamp up")
	else:
		$"/root/Singleton".play_sound("stamp down")
	await mouse_released
