extends Node

class Socket:
	var status: bool
	var _in: Socket
	
	func _init():
		status = false
		_in = null
	
	func check():
		if(_in == null):
			status = false
		else:
			status = _in.status

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
