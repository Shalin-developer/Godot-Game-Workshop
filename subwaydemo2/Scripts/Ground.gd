extends StaticBody3D

@export var speed: float = 5.0  # Speed of ground movement
@export var despawn_distance: float = 120.0  # Z-axis threshold for despawning

# Set speed externally
func set_speed(new_speed: float) -> void:
	speed = new_speed

func _process(delta: float) -> void:
	# Ensure the ground moves along the negative Z-axis toward the player
	global_transform.origin.z += speed * delta

	# Despawn the ground if it moves beyond the defined distance
	if global_transform.origin.z >= despawn_distance:
		print("Object Deleted")
		queue_free()
