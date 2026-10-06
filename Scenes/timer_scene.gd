extends Node2D

@onready var heart1: TextureRect = $Heart7
@onready var anim1: AnimationPlayer = $Heart7/AnimationPlayer
@onready var heart2: TextureRect = $Heart6
@onready var anim2: AnimationPlayer = $Heart6/AnimationPlayer
@onready var heart3: TextureRect = $Heart5
@onready var anim3: AnimationPlayer = $Heart5/AnimationPlayer
@onready var heart4: TextureRect = $Heart8
@onready var anim4: AnimationPlayer = $Heart8/AnimationPlayer
@onready var heart5: TextureRect = $Heart9
@onready var anim5: AnimationPlayer = $Heart9/AnimationPlayer

@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time
var bw = "res://addons/themillionthheartb&w.png"

func _ready() -> void:
	await Timer(5.0) 
	
	if Global.lives == 0:
			get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
	else: 
		if Global.minigames_done < 3: # if you havent completed 3 minigames yet 
			Global.minigames_done = Global.minigames_done +1
			get_tree().change_scene_to_file("res://Scenes/path_screen.tscn") # changes your scene by arranging this frankenstein path. 
		else: 
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn") # changes your scene



func _process(delta: float) -> void: # runs EVERY FRAME
	
	match Global.lives: 

		4:
			heart5.texture = load(bw)
			anim5.pause()
		3:
			heart5.texture = load(bw)
			anim5.pause()
			heart4.texture = load(bw)
			anim4.pause()
		2:
			heart5.texture = load(bw)
			anim5.pause()
			heart4.texture = load(bw)
			anim4.pause()
			heart3.texture = load(bw)
			anim3.pause()
		1:
			heart5.texture = load(bw)
			anim5.pause()
			heart4.texture = load(bw)
			anim4.pause()
			heart3.texture = load(bw)
			anim3.pause()
			heart2.texture = load(bw)
			anim2.pause()
		0:
			heart5.texture = load(bw)
			anim5.pause()
			heart4.texture = load(bw)
			anim4.pause()
			heart3.texture = load(bw)
			anim3.pause()
			heart2.texture = load(bw)
			anim2.pause()
			heart1.texture = load(bw)
			anim1.pause()
	
	timer.text = str(time) # make ths text reflect the value of the time variable. this makes names easier. the str() converts the int to a String
	level.text = "MINIGAME: " + str(Global.minigames_done + 1) # this tells you want minigame you're on using concatenation (google the word yo)

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the scrpit to wait for the function to complete before progressing
		time -= 0.1 # remove 0.1
		# progressively get the value smaller and smaller
	
	#when timer reaches 0
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait, dw abt this being complex '''
