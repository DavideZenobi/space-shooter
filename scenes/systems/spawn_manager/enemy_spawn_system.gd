extends Path2D

@onready var enemy_spawn_location: PathFollow2D = $EnemySpawnLocation;

func get_random_spawn_location() -> Vector2:
	enemy_spawn_location.progress_ratio = randf();
	return enemy_spawn_location.position;
