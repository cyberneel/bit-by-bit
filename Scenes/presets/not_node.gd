extends Node2D

var hover = false
var move = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and hover:
		move = !move

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move:
		position = get_global_mouse_position()
		position.y -= 25
	$"outputs/socket 1".status = !$"inputs/socket 1".status

func _on_mouse_entered() -> void:
	hover = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	hover = false
	pass # Replace with function body.
