
extends Node2D


@export var selected_socket = null  # Store first clicked socket
@export var connections = []  # Stores (from_socket, to_socket) pairs

func _ready()->void:
	$RayCast2D.enabled = true
	

func _input(event):
	if event.is_action_pressed("click"):
		$RayCast2D.position = get_global_mouse_position()
		$RayCast2D.target_position = get_global_mouse_position() - $RayCast2D.global_position
		$RayCast2D.force_raycast_update()
		if $RayCast2D.is_colliding():
			var clicked_socket = $RayCast2D.get_collider()
			if clicked_socket and clicked_socket.is_in_group("sockets"):
				print(clicked_socket)
				handle_socket_click(clicked_socket)

# Handle socket selection and connection
func handle_socket_click(socket):
	if selected_socket == null or (selected_socket.get_parent().get_parent() == socket.get_parent().get_parent() and selected_socket != socket) or (selected_socket.get_parent().name == socket.get_parent().name and selected_socket != socket):
		selected_socket = socket  # First socket selected
	elif selected_socket != socket:  # Second click (ensure different socket)
		var new_connection = [selected_socket, socket]
		
		if new_connection in connections:
			connections.erase(new_connection)  # Remove connection if already exists
		else:
			create_connection(selected_socket, socket)
		
		selected_socket = null  # Reset selection
	elif selected_socket == socket:
		print("del")
		# If the same socket is clicked again, remove all connections involving this socket
		for connection in connections:
			if socket in connection:
				for soc in connection:
					if soc.get_parent().name == "inputs":
						soc.inSoc = null
						soc.status = false
				connections.erase(connection)
			
		queue_redraw()
		selected_socket = null  # Reset selection

# Create and store the connection
func create_connection(socket_from, socket_to):
	if socket_to.get_parent().name == "inputs":
		connections.append([socket_from, socket_to])
		socket_to.inSoc = socket_from
	else:
		connections.append([socket_to, socket_from])
		socket_from.inSoc = socket_to
	queue_redraw()  # Update the visuals

# Draw connections between sockets
func _draw():
	for connection in connections:
		var start_pos = connection[0].global_position
		var end_pos = connection[1].global_position
		#add_child(Line2D.new())
		#var line: Line2D = get_child(get_child_count()-1)
		#var vector = Vector2(start_pos.x,start_pos.y)
		#var endVector = Vector2(end_pos.x, end_pos.y)
		#line.points.push_back(vector)
		#line.points.push_back(endVector)
		draw_line(start_pos, end_pos, Color.BLACK, 15)  # Draw black connection line
