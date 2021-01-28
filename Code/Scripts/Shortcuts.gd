extends Node2D


func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("shortcut_restart_timer"):
		$Count._on_CountUp_Button_pressed()
	if Input.is_action_just_pressed("shortcut_show_notes"):
		$Notes._on_Notes_Button_pressed()
