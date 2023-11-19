extends Node2D

@export var boxImage: CompressedTexture2D
@export var outbox = false

var in_a_box = false
var paper_manager
var desk_paper_manager

# Called when the node enters the scene tree for the first time.
func _ready():
	paper_manager = get_node("mailbox_area/paper_stack")
	desk_paper_manager = $/root/desk_root/paper_manager
	var texture = get_node("mailbox_area/box_texture")
	texture.texture = boxImage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for child in paper_manager.get_children():
		child.global_position.x = get_node("mailbox_area/paper_position").global_position.x - get_node("mailbox_area").scale.x*4
		child.global_position.y = get_node("mailbox_area/paper_position").global_position.y - get_node("mailbox_area").scale.y*2
		child.scale.x = .12
		child.scale.y = .12
	if in_a_box:
		if Input.is_action_just_pressed("right_mouse"):
			var paper_being_held
			if paper_manager.get_child_count() > 0:
				for child in desk_paper_manager.get_children():
					if child.held == true:
						paper_being_held = true
				if !paper_being_held:
					paper_manager.get_children()[-1].held = true
	if outbox:
		if $mailbox_area/paper_stack.get_child_count()>=$"/root/Singleton".forms:
			print("yay!")
			var temp = true
			for i in $mailbox_area/paper_stack.get_children():
				if i.get("approved")==-1 or i.get("approved")==null:
					temp = false
			if temp:
				$"/root/Singleton".analyze_forms()

func _on_area_2d_mouse_entered():
	in_a_box = true

func _on_area_2d_mouse_exited():
	in_a_box = false


func _on_paper_stack_child_entered_tree(node):
	node.global_position = self.get_node("mailbox_area/paper_position").global_position
	var angle = randf_range(-8,8)
	node.set_rotation_degrees(angle)
	



