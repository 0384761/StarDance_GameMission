extends Node2D

@onready var themed_timer: Node2D = $Themed_Timer 
@onready var pauseMenu: ColorRect = $OuterMenu

var buttons_pressed1 := 0
var buttons_pressed2 := 0
var timer_end = false

func _ready() -> void:
	
	await themed_timer.Timer(5.0) 
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed1 == 4:
		buttons_pressed1 = 0
		get_tree().change_scene_to_file("res://Scenes/minigame_2b.tscn")
	if buttons_pressed2 == 5:
		buttons_pressed2 = 0
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
