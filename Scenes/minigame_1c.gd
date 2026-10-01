extends Node2D

@onready var themed_timer: Node2D = $Themed_Timer 
# ^^^ You dragged this in the scene by the way 

var bone_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:

	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	
	if bone_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn") # back to intermission


func bones_collect() -> void: # cool function that you connect to those garlics
	bone_collected = bone_collected +1
	return
