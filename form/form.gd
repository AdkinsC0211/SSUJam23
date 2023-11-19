extends "res://scripts/paper_button_version.gd"

var approved = -1

var form_details = Form.new()

func _ready():
	pass


func fill_form(new_form:Form):
	$Name.text = "Name: " + new_form.alias
	$Org.text = "Organization / Company: " + new_form.organization
	$Amnt.text = "Requested Amount: " + new_form.amount
	$Reason.text = "Reason for Request: " + new_form.reason
	$Details.text = "Further Details:\n" + new_form.details
