extends Control

var text
# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/Correct.text = "Corrct = " + str($"/root/Singleton".accept) + "/" + str($"/root/Singleton".forms)
	$CenterContainer/VBoxContainer/Wrong.text = "Wrong = " + str($"/root/Singleton".reject) + "/" + str($"/root/Singleton".forms)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
