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
var layer = 0
var overlapping_areas: Array
var body_area

signal layer_update
signal overlapping_mailbox

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture_normal = paper_texture 
	body_area = self.get_node("paper_area")
	
	parent = self.get_parent()
	
	desk_paper_manager = $/root/desk_root/paper_manager
	desk_paper_manager_label = desk_paper_manager.get_name()
	desk_paper_manager.connect("update_paper_order",update_paper_order)
	
	inbox_manager = $/root/desk_root/inbox/mailbox_area/paper_stack
	inbox_label = inbox_manager.get_parent().get_parent().get_name()
	outbox_manager = $/root/desk_root/outbox/mailbox_area/paper_stack
	outbox_label = outbox_manager.get_parent().get_parent().get_name()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if held:
		self.set_rotation_degrees(0)
		global_position = get_global_mouse_position() - grab_offset
		overlapping_areas = body_area.get_overlapping_areas()
		if self.get_parent().get_name() != desk_paper_manager_label:
			self.reparent(desk_paper_manager_label)
		
	#print(self.get_parent().get_name())
	#print(desk_paper_manager_label)
	if self.get_parent().get_name() == desk_paper_manager_label and !held:
		for object in overlapping_areas:
			if object.get_parent().get_name() == outbox_label:
				self.reparent(outbox_manager)
				print("in outbox")
			
			
			if object.get_parent().get_name() == inbox_label:
				self.reparent(inbox_manager)




func update_paper_order():
	for child in parent.get_children():
		if child.held == true:
			child.layer = 0
		else:
			child.layer -= 1

func _on_pressed():
	held = !held
	if held and self.get_parent().get_name() != desk_paper_manager_label:
		self.reparent(desk_paper_manager)
	layer_update.emit()
	if held:
		grab_offset.x = get_global_mouse_position().x - self.global_position.x
		grab_offset.y = get_global_mouse_position().y - self.global_position.y
	


func _on_mouse_entered():
	self.scale.x = .4
	self.scale.y = .4


func _on_mouse_exited():
	self.scale.x = .35
	self.scale.y = .35


