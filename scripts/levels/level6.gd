extends Node

const XOR_nodes = 1
var XOR_nodes_placed = 0

var inputs: int
var outputs: int
var inputPreset = preload("res://Scenes/presets/input.tscn")

@export var input: Resource
@export var notGate: Resource
@export var andGate: Resource
@export var orGate: Resource
@export var nandGate: Resource
@export var norGate: Resource
@export var xorGate: Resource
@export var xnorGate: Resource
@export var output: Resource
@export var Camera: Resource



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()
	print(str(inputs) + '->' + str(outputs))
	$Win.hide()
	#input = inputPreset.instantiate()
	#add_child(input)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"Camera2D/CanvasLayer/Tool Bar/XOR_Counter".text = "x" + str(XOR_nodes - XOR_nodes_placed)
	if($output.get_child(3).get_child(0).status and XOR_nodes - XOR_nodes_placed == 0 and (($Input.get_child(3).get_child(0).status and not $Input2.get_child(3).get_child(0).status) or(not $Input.get_child(3).get_child(0).status and $Input2.get_child(3).get_child(0).status)) and $Grapher.connections.size() >= 3):
		$Win.show()
	else:
		$Win.hide()
	pass

func _on_input_pressed() -> void:
	var inputInstance = input.instantiate()
	inputInstance.position = get_node("Camera2D").position
	add_child(inputInstance)
func _on_not_pressed() -> void:
	var notInstance = notGate.instantiate()
	notInstance.scale *= 2
	notInstance.position = get_node("Camera2D").position
	add_child(notInstance)
func _on_and_pressed() -> void:
	var andInstance = andGate.instantiate()
	andInstance.scale *= 2
	andInstance.position = get_node("Camera2D").position
	add_child(andInstance)
func _on_or_pressed() -> void:
	var orInstance = orGate.instantiate()
	orInstance.scale *= 2
	orInstance.position = get_node("Camera2D").position
	add_child(orInstance)
func _on_nand_pressed() -> void:
	var nandInstance = nandGate.instantiate()
	nandInstance.scale *= 2
	nandInstance.position = get_node("Camera2D").position
	add_child(nandInstance)
func _on_nor_pressed() -> void:
	var norInstance = norGate.instantiate()
	norInstance.scale *= 2
	norInstance.position = get_node("Camera2D").position
	add_child(norInstance)
	
		
func _on_xor_pressed() -> void:
	if(XOR_nodes_placed >= XOR_nodes):
		pass
	else:
		var xorInstance = xorGate.instantiate()
		xorInstance.scale *= 2
		xorInstance.position = get_node("Camera2D").position
		add_child(xorInstance)
		XOR_nodes_placed +=1
func _on_xnor_pressed() -> void:
	var xnorInstance = xnorGate.instantiate()
	xnorInstance.scale *= 2
	xnorInstance.position = get_node("Camera2D").position
	add_child(xnorInstance)
func _on_output_pressed() -> void:
	var outputInstance = output.instantiate()
	outputInstance.position = get_node("Camera2D").position
	add_child(outputInstance)



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/challenge_menu.tscn")
	pass # Replace with function body.
