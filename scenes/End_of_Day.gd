extends Control

var text
# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/Correct.text = "Forms Filed Correctly: " + str($"/root/Singleton".accept) + "/" + str($"/root/Singleton".forms)
	$CenterContainer/VBoxContainer/Wrong.text = "Strikes Remaining: " + str($"/root/Singleton".strikes_left - $"/root/Singleton".strikes)
	$CenterContainer/VBoxContainer/Stolen.text = "Stolen Funds: " + str($"/root/Singleton".stolen_funds)
	$"/root/Singleton".play_sound("evil night bird")
	$"/root/Singleton".add_to_queue("coin bag")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/desk.tscn")
	$"/root/Singleton".play_sound("rooster")
	$"/root/Singleton".add_to_queue("door jingle")
	$"/root/Singleton".add_to_queue("chair creak")
