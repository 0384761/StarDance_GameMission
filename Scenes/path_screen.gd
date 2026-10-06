extends Node2D
@onready var one: RichTextLabel = $Instructions1
@onready var two: RichTextLabel = $Instructions2
@onready var three: RichTextLabel = $Instructions3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match Global.minigames_done:
		1:
			one.show()
		2:
			two.show()
		3:
			three.show()
	
	await get_tree().create_timer(5, false).timeout
	get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
