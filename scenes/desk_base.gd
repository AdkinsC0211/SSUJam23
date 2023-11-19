extends Node2D

var left_drawer
var top_right_drawer
var bot_right_drawer

# Called when the node enters the scene tree for the first time.
func _ready():
	left_drawer = $/root/desk_root/desk_base_root/left_drawer
	top_right_drawer = $/root/desk_root/desk_base_root/top_right_drawer
	bot_right_drawer = $/root/desk_root/desk_base_root/bot_right_drawer
	

func _enter_tree():
	if $"/root/Singleton".day == 1:
		$"/root/Singleton".call_deferred("add_papers")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_left_drawer_button_pressed():
	left_drawer.visible = true
	$"/root/Singleton".play_sound("drawer open")
	


func _on_top_right_drawer_button_pressed():
	top_right_drawer.visible = true
	$"/root/Singleton".play_sound("drawer open")
	
	


func _on_bot_right_drawer_button_pressed():
	bot_right_drawer.visible = true
	$"/root/Singleton".play_sound("drawer open")
