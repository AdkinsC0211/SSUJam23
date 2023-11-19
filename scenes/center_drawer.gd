extends Node2D

var close_face
var open_face

# Called when the node enters the scene tree for the first time.
func _ready():
	close_face = $close_face
	open_face = $open_face


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_face_button_pressed():
	close_face.visible = false
	open_face.visible = true

func _on_open_face_button_pressed():
	close_face.visible = true
	open_face.visible = false
