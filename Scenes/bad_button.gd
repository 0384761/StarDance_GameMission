extends TextureButton

@onready var parent = $".."
@onready var explosion = $"../Explosion"

func _on_pressed() -> void:
	await get_tree().create_timer(0.15).timeout
	explosion.show()
	await get_tree().create_timer(0.3).timeout
	Global.minigames_done -=1 
	Global.lives -= 1 
	get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
