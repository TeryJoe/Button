extends MarginContainer

const first_scene = preload("res://Start_scene.tscn")

onready var selector_one   = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two   = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer4/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_four  = $CenterContainer/VBoxContainer/CenterContainer5/VBoxContainer/CenterContainer/HBoxContainer/Selector

var current_selection = 1

func _ready():
	set_current_selection(1)

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_four.text = ""
	
	if _current_selection == 1:
		selector_one.text = ">"
	elif _current_selection == 2:
		selector_two.text = ">"
	elif _current_selection == 3:
		selector_three.text = ">"
	elif _current_selection == 4:
		selector_four.text = ">"

func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 4:
		current_selection += 1
		set_current_selection(current_selection)
	
	elif Input.is_action_just_pressed("ui_up") and current_selection > 1:
		current_selection -= 1
		set_current_selection(current_selection)
		
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection (current_selection)

func handle_selection(_current_selection):
	if _current_selection == 1:
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selection == 4:
		get_tree().quit()
		
