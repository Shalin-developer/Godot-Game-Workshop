extends Node3D

@export var object_scene_paths: Array[String] = [
	"res://Scenes/baricade.tscn",
	"res://Scenes/cargoTrain.tscn",
	"res://Scenes/yellowTrain.tscn"
]
@export var marker_names: Array[String] = ["Point1", "Point2", "Point3"]

@export var min_delay: float = 1.0  # Minimum delay in seconds (now a float)
@export var max_delay: float = 2.0  # Maximum delay in seconds (now a float)

func _ready() -> void:
	spawn_objects_endlessly()

func spawn_objects_endlessly() -> void:
	while true:
		var random_object_index = randi() % object_scene_paths.size()
		var random_marker_index = randi() % marker_names.size()

		var object_scene_path = object_scene_paths[random_object_index]
		var marker_name = marker_names[random_marker_index]

		var marker = get_parent().get_node(marker_name)
		if marker:
			# Calculate a random float delay between min_delay and max_delay
			var delay = randf_range(min_delay, max_delay)
			await get_tree().create_timer(delay).timeout
			spawn_object(marker.global_transform.origin, object_scene_path)
		else:
			print("Failed to find marker: ", marker_name)

func spawn_object(spawn_pos: Vector3, object_scene_path: String) -> void:
	var packed_scene: PackedScene = load(object_scene_path)
	if packed_scene:
		var instance = packed_scene.instantiate()
		add_child(instance)
		instance.global_position = spawn_pos
	else:
		print("Failed to load object scene: ", object_scene_path)
