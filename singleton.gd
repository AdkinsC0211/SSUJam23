extends Node 


@onready var soundplayer = AudioStreamPlayer.new()
var day = 1
var forms = 6
var accept = 0
var reject = 0
var strikes = 0
var strikes_left = 5
var max_forms = forms

var princess_prog = 0
var princess_skip = false
var king_prog = 0
var king_skip = true
var captain_prog = 0
var captain_skip = true
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
		temp.fill_form(load("res://form/citizen forms/form"+str(randi_range(1, 18))+".gd"))
		add_paper(temp)
	if princess_skip:
		princess_skip = false
	else:
		var temp = load("res://form/form.tscn").instantiate()
		temp.fill_form(load("res://form/princess forms/princessform"+str(princess_prog)+".gd"))
		add_paper(temp)
	if king_skip:
		king_skip = false
	else:
		var temp = load("res://form/form.tscn").instantiate()
		temp.fill_form(load("res://form/king forms/kingform"+str(king_prog)+".gd"))
		add_paper(temp)
	if captain_skip:
		captain_skip = false
	else:
		var temp = load("res://form/form.tscn").instantiate()
		temp.fill_form(load("res://form/captain forms/captainform"+str(captain_prog)+".gd"))
		add_paper(temp)
	

func add_paper(document):
	get_tree().get_root().find_child("inbox", true, false).add_child(document)
	forms += 1

func analyze_forms(outbox):
	for i in outbox.get_children():
		if i.approved == i.target_approved:
			if i.story == "princess":
				princess_skip = true
				princess_prog += 1
			elif i.story == "king":
				king_skip = true
				king_prog += 1
			elif i.story == "captain":
				captain_skip = true
				captain_prog += 1
			var strike_counter = strikes
			for v in i.get_children():
				if v.is_in_group("sticky"):
					var temp = v.get_node("LineEdit")
					if int(temp.text) > (i.max_amount - i.target_amount) or (i.max_amount < int(i.get_node("LineEdit").text)):
						strikes += 1
						break
			if strike_counter==strikes:
				accept += 1
		else:
			strikes += 1
	get_tree().change_scene_to_file("res://scenes/End_of_Day.tscn")
