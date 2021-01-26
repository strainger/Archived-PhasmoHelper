extends Node
var notes_shown = false


func _ready():
	pass


func _on_Notes_Button_pressed():
	if notes_shown == false:
		notes_shown = true
		get_node("AnimationPlayer").play("Notes_Animation")
		get_node("Notes_Button").text = "Hide Notes"
	else:
		notes_shown = false
		get_node("AnimationPlayer").play_backwards("Notes_Animation")
		get_node("Notes_Button").text = "Show Notes"
	pass # Replace with function body.
