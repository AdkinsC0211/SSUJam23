extends Node2D

var left_drawer
var top_right_drawer
var bot_right_drawer
var dragon_pose1
var dragon_pose2
var dragon_pose3

# Called when the node enters the scene tree for the first time.
func _ready():
	left_drawer = $/root/desk_root/desk_base_root/left_drawer
	top_right_drawer = $/root/desk_root/desk_base_root/top_right_drawer
	bot_right_drawer = $/root/desk_root/desk_base_root/bot_right_drawer
	dragon_pose1 = $/root/desk_root/desk_base_root/bot_right_drawer/dragon_pose1
	dragon_pose2 = $/root/desk_root/desk_base_root/bot_right_drawer/dragon_pose2
	dragon_pose3 = $/root/desk_root/desk_base_root/bot_right_drawer/dragon_pose3
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_left_drawer_button_pressed():
	left_drawer.visible = true

func _on_top_right_drawer_button_pressed():
	top_right_drawer.visible = true

func _on_bot_right_drawer_button_pressed():
	bot_right_drawer.visible = true
	var choice = randi_range(1,3)
	if choice == 1:
		dragon_pose1.visible = true
	elif choice == 2:
		dragon_pose2.visible = true
	else:
		dragon_pose3.visible = true
		
