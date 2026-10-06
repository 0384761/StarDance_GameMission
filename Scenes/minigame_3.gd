extends Node2D

@onready var themed_timer: Node2D = $Themed_Timer 
@onready var pauseMenu: ColorRect = $OuterMenu

var answer_one = false
var answer_two = false
var answer_three = false
var answer_four = false
var timer_end = false

func _ready() -> void:
	
	await themed_timer.Timer(10.0) 
	timer_end = true 

func _process(delta: float) -> void:
	
	if answer_one:
		answer_one = false
		get_tree().change_scene_to_file("res://Scenes/minigame_3b.tscn")
	elif answer_two:
		answer_two = false
		get_tree().change_scene_to_file("res://Scenes/minigame_3c.tscn")
	elif answer_three:
		answer_three = false
		get_tree().change_scene_to_file("res://Scenes/minigame_3d.tscn")
	elif answer_four:
		answer_four = false 
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")

func _input(ev):
	if Input.is_key_pressed(KEY_CTRL):
		get_tree().paused = true
		pauseMenu.visible = true
		pauseMenu.show()

func answered1():
	answer_one = true

func answered2():
	answer_two = true

func answered3():
	answer_three = true

func answered4():
	answer_four = true

	
