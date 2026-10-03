extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	Global.last_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://Scenes/settings_scene.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
