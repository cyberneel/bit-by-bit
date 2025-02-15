extends Node

class_name Socket

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
