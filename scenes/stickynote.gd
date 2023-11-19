extends Node2D
var held = false
var tex1 = preload("res://note1.png")
var tex2 = preload("res://note2.png")
var tex3 = preload("res://note3.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	match randi_range(1, 3):
		1:
			$TextureButton.texture = tex1
		2:
			$TextureButton.texture = tex2
		3:
			$TextureButton.texture = tex3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
	if Input.is_action_just_pressed("LMB") and held:
		var highest = null
		var height_index = -1
		for i in $Area2D.get_overlapping_areas():
			print(i.get_parent().get_index())
			if i.get_parent().get_index() > height_index and i.get_parent().is_in_group("paper"):
				height_index = i.get_parent().get_index()
				highest = i.get_parent()
		if highest != null:
			self.reparent(highest)
			$"/root/Singleton".play_sound("sticky down")
			if highest.get("approved")!=null:
				highest.approved = 0
			held = false
