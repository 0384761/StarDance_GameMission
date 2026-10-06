extends Node2D

@onready var themed_timer: Node2D = $Themed_Timer 
@onready var pauseMenu: ColorRect = $OuterMenu

var heart_collected = 0 
var brains_collected = 0 
var bone_collected = 0
var timer_end = false

func _ready() -> void:
	
	await themed_timer.Timer(10.0) 
	timer_end = true
	
func _process(delta: float) -> void: 
	
	if heart_collected == 3: 
		heart_collected = 0
		get_tree().change_scene_to_file("res://Scenes/minigame_1b.tscn")
		
	if brains_collected == 3:
		get_tree().change_scene_to_file("res://Scenes/minigame_1c.tscn")
		
	if bone_collected == 3:
		bone_collected = 0
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
	
	if timer_end: 
		Global.minigames_done -=1 
		Global.lives -= 1 
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")

func _input(ev):
	if Input.is_key_pressed(KEY_CTRL):
		get_tree().paused = true
		pauseMenu.visible = true
		pauseMenu.show()

func hearts_collect() -> void:
	heart_collected = heart_collected +1
	return
	
func brain_collect() -> void: 
	brains_collected = brains_collected +1
	return

func bones_collect() -> void: 
	bone_collected = bone_collected +1
	return
