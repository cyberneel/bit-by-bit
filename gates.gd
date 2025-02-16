extends Node

class_name Gate

var inSockets: Array = []
var outSockets: Array = []

@export var gateName: String = "gate"
	
func _init(ins: int = 1, outs: int = 1) -> void:
	for x in range(ins):
		inSockets.append(Socket.new())
	for x in range(ins):
		inSockets.append(Socket.new())
		
func _process(delta: float) -> void:
	outSockets[0] = inSockets[0]
