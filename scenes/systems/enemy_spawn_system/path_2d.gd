extends Path2D

@onready var path_follow: PathFollow2D = $PathFollow2D;

func get_random_location():
	path_follow.progress_ratio = randf();
	return path_follow.position;
