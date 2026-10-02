extends Button

@onready var parent = $"../.."
@onready var message = $"../../Correct"

signal answered

func _on_pressed() -> void:
	message.show()
	await get_tree().create_timer(0.5).timeout
	emit_signal("answered")
