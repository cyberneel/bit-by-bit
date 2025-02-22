extends Node2D
@export var notGate: Resource
@export var andGate: Resource
@export var orGate: Resource
@export var nandGate: Resource
@export var norGate: Resource
@export var xorGate: Resource
@export var xnorGate: Resource
@export var Camera: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/challenge_menu.tscn")
	pass

func _on_not_pressed() -> void:
	var notInstance = notGate.instantiate()
	add_child(notInstance)
func _on_and_pressed() -> void:
	var andInstance = andGate.instantiate()
	add_child(andInstance)
func _on_or_pressed() -> void:
	var orInstance = orGate.instantiate()
	add_child(orInstance)
func _on_nand_pressed() -> void:
	var nandInstance = nandGate.instantiate()
	add_child(nandInstance)
func _on_nor_pressed() -> void:
	var norInstance = norGate.instantiate()
	add_child(norInstance)
func _on_xor_pressed() -> void:
	var xorInstance = xorGate.instantiate()
	add_child(xorInstance)
func _on_xnor_pressed() -> void:
	var xnorInstance = xnorGate.instantiate()
	add_child(xnorInstance)
