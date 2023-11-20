extends Node 


@onready var soundplayer = AudioStreamPlayer.new()
var day = 1
var forms = 6
var accept = 0
var reject = 0
var strikes = 0
var strikes_left = 5
var max_forms = forms

var stolen_funds = 0

var princess_prog = 1
var princess_skip = false
var princess_denied = false
var king_prog = 1
var king_skip = true
var last_king_denied = 0
var king_denied = 0
var captain_prog = 1
var captain_skip = true
var captain_denied = 0
var last_captain_denied = 0
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
		var temp2 = load("res://form/citizen forms/citizen"+str(randi_range(1, 29))+".gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		add_paper(temp)
	if princess_prog==1:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/princess forms/princessform1.gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="princess"
		add_paper(temp)
		print("fuck you")
	elif princess_prog==2:
		if princess_denied:
			princess_denied=false
			get_tree().get_root().find_child("inbox", true, false).add_child(load("res://scenes/princessdenial1.tscn").instantiate())
			var temp = load("res://form/form.tscn").instantiate()
			var temp2 = load("res://form/princess forms/princessform1denied.gd").new()
			temp2.update_form()
			temp.fill_form(temp2)
			temp.story="princess"
			add_paper(temp)
		else:
			princess_prog+=2
	elif princess_prog==3:
		princess_prog+=1
	elif princess_prog==4:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/princess forms/princessform2.gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="princess"
		add_paper(temp)
	elif princess_prog==5:
		get_tree().get_root().find_child("inbox", true, false).add_child(load("res://scenes/princesskingresponse1.tscn").instantiate())
		princess_prog+=1
	elif princess_prog==6:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/princess forms/princessform3.gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="princess"
		add_paper(temp)
	elif princess_prog==7:
		if princess_denied:
			princess_prog+=1
			get_tree().get_root().find_child("inbox", true, false).add_child(load("res://scenes/princessdenial2.tscn").instantiate())
		else:
			princess_prog+=1
			get_tree().get_root().find_child("inbox", true, false).add_child(load("res://scenes/princesskingresponse2.tscn").instantiate())
	elif princess_prog==8:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/princess forms/princessform4.gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="princess"
		add_paper(temp)
	elif princess_prog==9:
		if not princess_denied:
			get_tree().get_root().find_child("inbox", true, false).add_child(load("res://scenes/princessacceptance1.tscn").instantiate())
			princess_prog+=1
	elif princess_prog==10:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/princess forms/princessform5.gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="princess"
		add_paper(temp)
	elif princess_prog==11:
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")     #go to end scene
	
	if not king_skip:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/king forms/kingform"+str(king_prog)+".gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="king"
		add_paper(temp)
	else:
		king_skip=false
	
	if last_king_denied!=king_denied:
		last_king_denied = king_denied
		if last_king_denied == 1:
			pass
			#spawn letter corresponding to how many times you denied
		elif last_king_denied == 2:
			pass
			#spawn letter corresponding to how many times you denied
		else:
			get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
			#once we have end screens thisll be the one where you die
	if king_prog > 5:
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
		
		
	if not captain_skip:
		var temp = load("res://form/form.tscn").instantiate()
		var temp2 = load("res://form/captain forms/captainform"+str(captain_prog)+".gd").new()
		temp2.update_form()
		temp.fill_form(temp2)
		temp.story="captain"
		add_paper(temp)
	else:
		captain_skip=false
	
	if last_captain_denied!=captain_denied:
		last_captain_denied = captain_denied
		if last_captain_denied == 1:
			pass
			#spawn letter corresponding to how many times you denied
		elif last_captain_denied == 2:
			pass
			#spawn letter corresponding to how many times you denied
		else:
			get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
			#once we have end screens thisll be the one where you die
	if captain_prog > 5:
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
	





func add_paper(document, count_up=true):
	get_tree().get_root().find_child("inbox", true, false).add_child(document)
	if count_up:
		forms += 1

func analyze_forms(outbox):
	for i in outbox.get_children():
		if i.story=="princess":
			princess_prog+=1
			if i.approved == 0:
				princess_denied = true
		elif i.story=="king":
			king_prog+=1
			king_skip=true
			if i.approved == 0:
				king_denied +=1
		elif i.story=="captain":
			captain_prog+=1
			if i.approved == 0:
				captain_denied +=1
		if i.approved == i.target_approved:
			var strike_counter = strikes
			for v in i.get_children():
				if v.is_in_group("sticky"):
					var temp = v.get_node("LineEdit")
					if int(temp.text) > (i.max_amount - i.target_amount) or (i.max_amount < int(i.get_node("LineEdit").text)):
						strikes += 1
						break
					else:
						stolen_funds += int(temp.text)
						break
			if strike_counter==strikes:
				accept += 1
		else:
			strikes += 1
	get_tree().change_scene_to_file("res://scenes/End_of_Day.tscn")
