extends Node2D
@onready var garlic_container: HBoxContainer = $HeartContainer
@onready var garlic: TextureRect = $HeartContainer/Heart1
@onready var garlic_2: TextureRect = $HeartContainer/Heart2
@onready var garlic_3: TextureRect = $HeartContainer/Heart3
@onready var garlic_4: TextureRect = $HeartContainer/Heart4
@onready var garlic_5: TextureRect = $HeartContainer/Heart5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time
var bw = "res://addons/themillionthheartb&w.png"

func _ready() -> void:
	await Timer(5.0) # using the function created
	
	if Global.lives == 0:
			get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
	else: 
		if Global.minigames_done < 2: # if you havent completed 3 minigames yet 
			Global.minigames_done = Global.minigames_done +1
			get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path. 
		else: 
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn") # changes your scene



func _process(delta: float) -> void: # runs EVERY FRAME
	
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

		4:
			garlic_5.texture = load(bw)
		3:
			garlic_5.texture = load(bw)
			garlic_4.texture = load(bw)
		2:
			garlic_5.texture = load(bw)
			garlic_4.texture = load(bw)
			garlic_3.texture = load(bw)
		1:
			garlic_5.texture = load(bw)
			garlic_4.texture = load(bw)
			garlic_3.texture = load(bw)
			garlic_2.texture = load(bw)
		0:
			garlic.texture = load(bw)
			garlic_2.texture = load(bw)
			garlic_3.texture = load(bw)
			garlic_4.texture = load(bw)
			garlic_5.texture = load(bw)
	
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
