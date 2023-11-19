extends Node

@onready var soundplayer = AudioStreamPlayer.new()
var day = 1
var forms = 6
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
	forms = 0
	for i in range(5):
		var temp = load("res://form/form.tscn").instantiate()
		add_paper(temp)

func add_paper(document):
	get_tree().get_root().find_child("inbox", true, false).add_child(document)
	forms += 1
