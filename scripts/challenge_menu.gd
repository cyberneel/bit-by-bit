extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level.tscn")
	pass # Replace with function body.
func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level2.tscn")
	pass # Replace with function body.
func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level3.tscn")
	pass # Replace with function body.
func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level4.tscn")
	pass # Replace with function body.
func _on_button_6_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level5.tscn")
	pass # Replace with function body.
func _on_button_7_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level6.tscn")
	pass # Replace with function body.
func _on_button_8_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level7.tscn")
	pass # Replace with function body.
func _on_button_9_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level_gangsallhere.tscn")
	pass # Replace with function body.
func _on_button_10_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level_triumvirateofxors.tscn")
	pass # Replace with function body.
func _on_button_11_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level_negativenancies.tscn")
	pass # Replace with function body.
