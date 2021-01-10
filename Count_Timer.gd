extends Node

var count_down_timer_seconds = 0
var count_down_timer_minutes = 0
var count_down_complete = false

var count_up_timer_seconds = 0 
var count_up_timer_minutes = 0
var count_up_timer_hours = 0

func _ready():
	var difficulty_select = get_node("CountDown_Difficulty").get_popup()
	difficulty_select.connect("id_pressed", self, "select_difficulty")
	pass

func _process(delta):
	if count_down_timer_minutes == 0 and count_down_timer_seconds == 0:
		if get_node("CountDown_Start").disabled == true:
			if count_down_complete == false:
				get_node("CountUp_Timer").start()
				count_down_complete = true
	if count_down_complete == false:
		if count_down_timer_seconds < 0:
			count_down_timer_seconds = 59
			count_down_timer_minutes -= 1
	else:
		count_down_timer_minutes = 0
		count_down_timer_seconds = 0
			
	if count_up_timer_seconds > 59:
		count_up_timer_seconds = 0
		count_up_timer_minutes += 1
	if count_up_timer_minutes > 59:
		count_up_timer_minutes = 0
		count_up_timer_hours += 1
		
	get_node("CountUp_Text").set_text( str("%02d" % count_up_timer_hours )+":"+str("%02d" % count_up_timer_minutes )+":"+str( "%02d" % count_up_timer_seconds ) )
	get_node("CountDown_Text").set_text( str( "%02d" % count_down_timer_minutes ) + ":" + str( "%02d" % count_down_timer_seconds ) )
	
	pass

func select_difficulty( id ):
	get_node("CountDown_Difficulty").text = "Setup Count Down"
	get_node("CountDown_Difficulty").disabled = true
	match id:
		0:
			count_down_timer_minutes = 0
		1:
			count_down_timer_minutes = 2
		2:
			count_down_timer_minutes = 5
	pass

func _on_CountDown_Timer_timeout():
	count_down_timer_seconds -= 1
	pass
	
func _on_CountUp_Timer_timeout():
	count_up_timer_seconds += 1
	pass

func _on_CountDown_Start_pressed():
	if get_node("CountDown_Difficulty").disabled == true:
		get_node("CountDown_Start").disabled = true
		get_node("CountDown_Timer").start()
	else:
		get_node("CountDown_Popup").popup()
	pass
