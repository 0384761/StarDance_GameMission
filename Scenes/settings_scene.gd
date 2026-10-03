extends Node2D

@onready var bg_music: AudioStreamPlayer = $"/root/BgMusic"
@onready var volume_label: Button = $VBoxContainer/Volume
@onready var volume_slider: HSlider = $VBoxContainer/AudioControl
@onready var on_off: CheckButton = $VBoxContainer/Playing
@onready var music_choice: OptionButton = $VBoxContainer/Music

func _ready() -> void:
	music_choice.select(Global.music)
	on_off.button_pressed = !bg_music.stream_paused
	volume_slider.value = Global.music_level

func _process(delta: float) -> void:
	
	if Global.silent:
		bg_music.stream_paused = true
	volume_label.text = "Volume " + str(get_level()) + "%"

func _on_playing_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.silent = false
		bg_music.stream_paused = false
	else:
		Global.silent = true

func _on_item_selected(index: int) -> void:
	var current_music = bg_music.get_stream()
	match index:
		0:
			Global.music = 0
			bg_music.set_stream(current_music.load_from_file("res://addons/TheFray.mp3"))
			bg_music.play()
		1:
			Global.music = 1
			bg_music.set_stream(current_music.load_from_file("res://addons/SnowPatrol.mp3"))
			bg_music.play()
		2:
			Global.music = 2
			bg_music.set_stream(current_music.load_from_file("res://addons/Keane.mp3"))
			bg_music.play()
		3:
			Global.music = 3
			bg_music.set_stream(current_music.load_from_file("res://addons/SnowPatrol.mp3"))
			bg_music.play()

func _on_back_pressed() -> void:
	Global.music_level = float(get_level()) / 100
	get_tree().change_scene_to_file(Global.last_scene)

func get_level() -> int: 
	var current = int(100 * db_to_linear(volume_slider.db))
	return current
	
	
