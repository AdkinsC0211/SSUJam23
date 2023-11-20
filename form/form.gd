extends "res://scripts/paper_button_version.gd"

var approved = -1
var target_approved = 0
var amount = 0
var target_amount = 0
var max_amount = 0
var will_return = false
var story = ""

var form_details = Form.new()


func fill_form(new_form:Form):
	$Name.text = "Name: " + new_form.alias
	$Org.text = "Organization / Company: " + new_form.organization
	$Amnt.text = "Requested Amount: " + new_form.amount
	$Reason.text = "Reason for Request: " + new_form.reason
	$Details.text = "Further Details: " + new_form.details
	target_amount = new_form.target_amount
	target_approved = new_form.target_approved
	max_amount = new_form.largest_amount
	will_return = new_form.plz_fix
