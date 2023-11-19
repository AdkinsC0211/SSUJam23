extends AudioStreamPlayer

var sound1 = preload("res://sounds/candle1.wav")
var sound2 = preload("res://sounds/candle2.wav")
var sound3 = preload("res://sounds/candle3.wav")
var can_play = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if can_play:
		can_play = false
		do()

func do():
	await get_tree().create_timer(randf_range(0.01, 10)).timeout
	var temp = randi_range(0, 2)
	match temp:
		0:
			stream = sound1
		1:
			stream = sound2
		2:
			stream = sound3
	play()
	can_play = true
