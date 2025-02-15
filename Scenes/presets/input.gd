extends Area2D

class_name InputBit

@export_category("Input Bit")
@export var onColor: Color = Color.FIREBRICK
@export var offColor: Color = Color.DIM_GRAY
@export var outSocket: Socket = Socket.new()

var mouseHover: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with funghction body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouseHover:
		outSocket.status = !outSocket.status
		get_parent().get_child(1).modulate = (onColor if outSocket.status else offColor)
		print(outSocket.status)
		
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
