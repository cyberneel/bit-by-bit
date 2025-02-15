extends Node

class_name Socket

@export var status: bool
@export var _in: Socket

func _init():
	status = false
	_in = null

func check():
	if(_in):
		status = _in.status
		
	if status:
		$Sprite2D.modulate = Color.SILVER
	else:
		$Sprite2D.modulate = Color.BLACK
		
func _process(delta: float) -> void:
	check()
