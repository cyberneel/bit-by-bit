extends Area2D

class_name OutputBit

@export_category("Output Bit")
@export var onColor: Color = Color.FIREBRICK
@export var offColor: Color = Color.DIM_GRAY
@export var inSocket: Socket

var mouseHover: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inSocket = get_parent().get_child(3).get_child(0)
	self.self_modulate = offColor
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().get_child(1).modulate = (onColor if inSocket.status else offColor)
	pass
