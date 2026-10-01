
extends TextureButton

@onready var parent = $".."

func _on_pressed() -> void:
	hide()
	parent.buttons_pressed2 += 1
