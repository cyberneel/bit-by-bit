extends Node2D

# Smooth panning and precise zooming for Camera2D
class_name CameraZoomAndPan

@onready var camera : Camera2D = $".." if ($".." is Camera2D) else self
@onready var toolbar := $CanvasLayer/Toolbar  # Adjust path if necessary

@onready var grid_shader_material = get_child(0).material # Replace with actual node path

#region Exported Parameters
@export_range(1, 20, 0.01) var maxZoom : float = 5.0
@export_range(0.01, 1, 0.01) var minZoom : float = 0.8
@export_range(0.01, 0.2, 0.01) var zoomStepRatio : float = 0.1

@export_group("Actions")
@export var panAction : String = "camera>pan"
@export var zoomInAction : String = "camera>zoom+"
@export var zoomOutAction : String = "camera>zoom-"

@export_group("Mouse")
@export var zoomToCursor: bool = true
@export_enum("Auto", "Always", "Never") var useFallbackButtons: String = "Auto"
@export var panButton : MouseButton = MOUSE_BUTTON_MIDDLE
@export var panButton2 : MouseButton = MOUSE_BUTTON_RIGHT
@export var zoomInButton : MouseButton = MOUSE_BUTTON_WHEEL_UP
@export var zoomOutButton : MouseButton = MOUSE_BUTTON_WHEEL_DOWN

@export_group("Smoothing")

@export_range(0, 0.99, 0.01) var panSmoothing : float = 0.5:
	set(new_value):
		panSmoothing = pow(new_value, slider_exponent)
	get:
		return panSmoothing

@export_range(0, 0.99, 0.01) var zoomSmoothing : float = 0.5:
	set(new_value):
		zoomSmoothing = pow(new_value, slider_exponent)
	get:
		return zoomSmoothing

const slider_exponent : float = 0.25
const referenceFPS : float = 120.0
#endregion

#region State Initialization
@onready var zoom_goal := camera.zoom
@onready var position_goal := camera.position

var fallback_mouse_pan : bool
var fallback_mouse_zoom_in : bool
var fallback_mouse_zoom_out : bool
var last_mouse : Vector2
var zoom_mouse : Vector2

func _ready() -> void:
	panSmoothing = panSmoothing
	zoomSmoothing = zoomSmoothing

	var actions = InputMap.get_actions()
	var always = useFallbackButtons == "Always"
	var never = useFallbackButtons == "Never"
	fallback_mouse_pan = not never and (always or (panAction not in actions))
	fallback_mouse_zoom_in = not never and (always or (zoomInAction not in actions))
	fallback_mouse_zoom_out = not never and (always or (zoomOutAction not in actions))

	if not always and (fallback_mouse_pan or fallback_mouse_zoom_in or fallback_mouse_zoom_out):
		prints("CameraZoomAndPan: Mouse Fallbacks for Actions in effect!",
			panAction + "=" + str(fallback_mouse_pan),
			zoomInAction + "=" + str(fallback_mouse_zoom_in),
			zoomOutAction + "=" + str(fallback_mouse_zoom_out))
		printt("CameraZoomAndPan: TIP - set up all three of the following InputActions:", panAction, zoomInAction, zoomOutAction)
#endregion

func _process(delta: float) -> void:
	# Grid Stuff
	if grid_shader_material:
		grid_shader_material.set_shader_parameter("camera_offset", global_position)
	
	var k_pan := pow(panSmoothing, referenceFPS * delta)
	var k_zoom := pow(zoomSmoothing, referenceFPS * delta)

	var mouse_pre_zoom := to_local(get_canvas_transform().affine_inverse().basis_xform(zoom_mouse))
	camera.zoom = camera.zoom * k_zoom + (1.0-k_zoom) * zoom_goal
	var mouse_post_zoom := to_local(get_canvas_transform().affine_inverse().basis_xform(zoom_mouse))

	var zoom_position_offset := (mouse_pre_zoom - mouse_post_zoom) if zoomToCursor else Vector2.ZERO
	
	position_goal += zoom_position_offset
	camera.position = camera.position * k_pan + (1.0-k_pan) * position_goal + zoom_position_offset

	# Ensure the toolbar scales with the camera zoom
	if toolbar:
		toolbar.size = get_viewport_rect().size / camera.zoom

func _input(event: InputEvent) -> void:
	if not event is InputEventMouse and not event is InputEventAction:
		return

	var current_mouse := get_local_mouse_position()
	if Input.is_action_pressed(panAction) or (fallback_mouse_pan and Input.is_mouse_button_pressed(panButton2)) or (fallback_mouse_pan and Input.is_mouse_button_pressed(panButton)):
		position_goal += (last_mouse - current_mouse)

	if Input.is_action_just_pressed(zoomInAction) or (fallback_mouse_zoom_in and Input.is_mouse_button_pressed(zoomInButton)):
		zoom_goal *= 1.0 / (1.0-zoomStepRatio)
		zoom_mouse = get_viewport().get_mouse_position()
		zoom_mouse -= get_viewport_rect().size * 0.5

	if Input.is_action_just_pressed(zoomOutAction) or (fallback_mouse_zoom_out and Input.is_mouse_button_pressed(zoomOutButton)):
		zoom_goal *= (1.0-zoomStepRatio)
		zoom_mouse = get_viewport().get_mouse_position()
		zoom_mouse -= get_viewport_rect().size * 0.5

	zoom_goal = zoom_goal.clamp(minZoom * Vector2.ONE, maxZoom * Vector2.ONE)
	last_mouse = current_mouse
