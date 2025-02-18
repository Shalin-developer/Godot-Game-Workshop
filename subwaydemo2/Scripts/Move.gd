extends RigidBody3D

@export var move_speed: float = 5.0
@export var move_direction: Vector3 = Vector3(0, 0, 1)

func _ready() -> void:
	# Set the initial velocity in the z direction
	linear_velocity = move_direction.normalized() * move_speed

func _physics_process(delta: float) -> void:
	# Continuously update the linear velocity to ensure the object keeps moving
	linear_velocity = move_direction.normalized() * move_speed
