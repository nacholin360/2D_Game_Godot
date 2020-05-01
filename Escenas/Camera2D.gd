extends Camera2D

export (int) var limite_camera2d

# Called when the node enters the scene tree for the first time.
func _ready():
	limite_camera2d = get_camera_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
