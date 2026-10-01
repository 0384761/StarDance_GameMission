extends Node2D
@onready var pauseMenu: ColorRect = $OuterMenu
@onready var themed_timer: Node2D = $Themed_Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(10.0) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(ev):
	if Input.is_key_pressed(KEY_CTRL):
		themed_timer.pause()
		pauseMenu.visible = true
		pauseMenu.show()
		
