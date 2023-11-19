extends Node

@onready var soundplayer = AudioStreamPlayer.new()
@onready var form_scene = preload("res://scenes/form.tscn")
var day = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(soundplayer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func play_sound(sound_name:String):
	soundplayer.stream = load("res://sounds/"+sound_name+".wav")
	soundplayer.play()

func stop_sound():
	soundplayer.stop()

func add_papers():
	for i in range(5):
		var temp = form_scene.instantiate()
		add_paper(temp)

func add_paper(document):
	pass
	#get_tree().get_root().find_child("inbox", true).add_child(document)
