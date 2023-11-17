extends Node

signal update_paper_order


# Called when the node enters the scene tree for the first time.
func _ready():
	for paper in self.get_children():
		if(!paper.is_connected("layer_update",sort_paper_order)):
			paper.connect("layer_update",sort_paper_order)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func sort_paper_order():
	update_paper_order.emit()
	for child in self.get_children():
		if child != self.get_child(-1):
			if child.layer >= self.get_child(-1).layer:
				move_child(child,-1)
		#print(child.get_name() + " " + str(child.layer))
	#print(self.get_children())
	
