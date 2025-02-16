extends Label

var a = 0
var node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	node = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	a += 0.5
	node.position = Vector2(node.position.x, node.position.y +  0.08 * (sin(deg_to_rad(a))))
	pass
