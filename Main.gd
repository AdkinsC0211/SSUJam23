extends Node2D

var gstamp: Node2D 
var rstamp: Node2D
var stamper: Node2D 
var stamper1: Node2D
var notes: Node2D
var rulebook: Node2D
var moving: bool = false

func _ready():
	$Timer.start()
	gstamp = $stampg
	rstamp = $rstamp
	stamper = $gstamper
	stamper1 = $rstamper
	#notes = $notes
	#rulebook = $lawbook
	
func _process(delta):
		
	if stamper != null:
		if Input.is_action_just_pressed("MMB") && stamper.picked_up:
			gstamp.global_position = stamper.global_position + Vector2(0, 90)
			gstamp.global_scale = Vector2(0.5, 0.5)
			gstamp.visible = true	
	
	if Input.is_action_just_pressed("MMB") && stamper1.picked_up:
		rstamp.global_position = stamper1.global_position + Vector2(0, 90)
		rstamp.global_scale = Vector2(0.5, 0.5)
		rstamp.visible = true	
	
	if Input.is_action_just_released("MMB"):
		gstamp.global_scale = Vector2(1, 1)
		rstamp.global_scale = Vector2(1, 1)
		
func _on_timer_timeout():
	gstamp.visible = false
	rstamp.visible = false
	
