extends Node

class_name Socket

@export var status: bool
@export var inSoc: Socket

func _init():
	status = false
	inSoc = null

func check():
	if(inSoc):
		status = inSoc.status
		
	if status:
		$Sprite2D.modulate = Color.SILVER
	else:
		$Sprite2D.modulate = Color.BLACK
		

func _ready() -> void:
	add_to_group("sockets")

func _process(delta: float) -> void:
	check()
