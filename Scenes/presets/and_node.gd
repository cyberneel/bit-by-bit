extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"inputs/socket 1".status and $"inputs/socket 2".status:
		$"outputs/socket 1".status = true
	else:
		$"outputs/socket 1".status = false
	pass
