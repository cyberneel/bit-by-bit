extends Node


var inputs: int;
var outputs: int;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("" + str(inputs) + '->' + str(outputs));
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
