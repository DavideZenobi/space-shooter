extends Node

@onready var spawn_tracker_enemy_timer: Timer = $SpawnTrackerEnemy;
var max_trackers: int = 10;
var trackers_count: int = 0;

var enemy_manager: EnemyManager;

func _ready():
	enemy_manager = EnemyManager.new();

func spawn(enemy_type):
	match enemy_type:
		Util.EnemyTypes.LIGHTWEIGHT:
			pass;
		Util.EnemyTypes.TRACKER:
			spawn_tracker_enemy_timer.start();
		Util.EnemyTypes.TANK:
			pass;
		Util.EnemyTypes.BOMBARDIER:
			pass;

func spawn_tracker():
	var new_enemy_difficulty = get_random_enemy_difficulty();
	var new_enemy = enemy_manager.create_enemy(Util.EnemyTypes.TRACKER, new_enemy_difficulty);
	

func get_random_enemy_type() -> Util.EnemyTypes:
	return Util.EnemyTypes.values()[randi_range(0, Util.EnemyTypes.size() - 1)];

func get_random_enemy_difficulty() -> Util.EnemyDifficulties:
	return Util.EnemyDifficulties.values()[randi_range(0, Util.EnemyDifficulties.size() - 1)];

func _on_spawn_tracker_enemy_timeout():
	spawn_tracker();
	trackers_count += 1;
	if trackers_count >= max_trackers:
		spawn_tracker_enemy_timer.stop();
