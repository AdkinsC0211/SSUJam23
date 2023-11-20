extends Control

var text
# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/Correct.text = "Forms Filed Correctly: " + str($"/root/Singleton".accept) + "/" + str($"/root/Singleton".forms)
	$CenterContainer/VBoxContainer/Wrong.text = "Strikes Remaining: " + str($"/root/Singleton".strikes_left - $"/root/Singleton".strikes)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
