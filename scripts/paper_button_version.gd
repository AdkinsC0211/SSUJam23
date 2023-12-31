extends TextureButton

@export var paper_texture: CompressedTexture2D = preload("res://ui_elements/paper.png")

var grab_offset:Vector2 = Vector2(0,0)
var held = false
var parent
var desk_paper_manager
var desk_paper_manager_label
var inbox_manager
var inbox_label
var outbox_manager
var outbox_label
var shredder_label
var layer = 0
var overlapping_areas: Array
var body_area
var reading_mode: bool
var spot


signal overlapping_mailbox

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture_normal = paper_texture 
	body_area = self.get_node("paper_area")
	
	parent = self.get_parent()
	
	desk_paper_manager = $/root/desk_root/paper_manager
	desk_paper_manager_label = desk_paper_manager.get_name()
	
	inbox_manager = $/root/desk_root/desk/inbox/mailbox_area/paper_stack
	inbox_label = inbox_manager.get_parent().get_parent().get_name()
	
	outbox_manager = $/root/desk_root/desk/outbox/mailbox_area/paper_stack
	outbox_label = outbox_manager.get_parent().get_parent().get_name()
	
	shredder_label = $/root/desk_root/desk_base_root/bot_right_drawer/Area2D.get_name()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if held and !reading_mode:
		self.set_rotation_degrees(0)
		global_position = get_global_mouse_position() - grab_offset
		overlapping_areas = body_area.get_overlapping_areas()
		if self.get_parent().get_name() != desk_paper_manager_label:
			self.reparent(desk_paper_manager)
			parent = self.get_parent()
		
	if self.get_parent().get_name() == desk_paper_manager_label and !held:
		for object in overlapping_areas:
			if object.get_parent().get_name() == outbox_label:
				self.reparent(outbox_manager)
				parent = self.get_parent()
				return
				
			if object.get_parent().get_name() == shredder_label:
				queue_free()
				return
				
			if object.get_parent().get_name() == inbox_label:
				self.reparent(inbox_manager)
				parent = self.get_parent()
				return







func _on_pressed():
	if self.get_parent() == desk_paper_manager:
		desk_paper_manager.move_child(self,-1)
	if Input.is_action_pressed("left_mouse"):
		if self.get_parent().get_name() == desk_paper_manager_label:
			reading_mode = !reading_mode
		if self.get_parent().get_name() == desk_paper_manager_label:
			if reading_mode:
				spot = self.global_position
				global_position = Vector2(300,0)
				self.scale.x = .9
				self.scale.y = .85
				
				$"/root/Singleton".play_sound("paper flip")
			elif !reading_mode:
				self.scale.x = .2
				self.scale.y = .2
				global_position = spot
				$"/root/Singleton".play_sound("page down")
			
	elif Input.is_action_just_pressed("right_mouse"):
		if !reading_mode:
			held = !held
		if held and self.get_parent().get_name() != desk_paper_manager_label:
			self.reparent(desk_paper_manager)
			parent = self.get_parent()
		if held and !reading_mode:
			$"/root/Singleton".play_sound("page up")
			grab_offset.x = get_global_mouse_position().x - self.global_position.x
			grab_offset.y = get_global_mouse_position().y - self.global_position.y
		elif !reading_mode:
			$"/root/Singleton".play_sound("page down")
	


func _on_mouse_entered():
	if !reading_mode:
		self.scale.x = .3
		self.scale.y = .3


func _on_mouse_exited():
	if !reading_mode:
		self.scale.x = .2
		self.scale.y = .2
