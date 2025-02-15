extends Area2D

class_name InputBit

var status: bool = false

var mouseHover: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouseHover:
		status = !status
		print(status)
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_exited() -> void:
	mouseHover = false
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	mouseHover = true
	pass # Replace with function body.
