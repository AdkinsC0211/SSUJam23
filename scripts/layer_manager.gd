extends Node




# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass	
	

func _on_child_entered_tree(node):
	node.set_rotation_degrees(0)
