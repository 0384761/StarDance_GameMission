extends Node2D

func _on_restart_pressed() -> void:
	get_tree().paused = false
	Global.minigames_done -=1 
	get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")

func _on_continue_pressed() -> void:
	get_tree().paused = false
	self.hide()
	self.get_parent().hide()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _on_settings_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/settings_scene.tscn")
