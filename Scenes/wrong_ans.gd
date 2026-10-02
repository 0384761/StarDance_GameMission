extends Button

@onready var message = $"../../Incorrect"

func _on_pressed() -> void:
	message.show()
	Global.lives -= 1
	Global.minigames_done -=1
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
