extends Node

var current_level: Util.Levels;

@export var enemy_total_quantity: int;

@onready var start_timer: Timer = $Start;
@onready var enemy_cooldown_timer: Timer = $EnemyCooldown;
@onready var wave_timer: Timer = $Wave;
@onready var break_timer: Timer = $Break;

var enemy_manager: EnemyManager;

func _ready():
	enemy_manager = EnemyManager.new();
	start_timer.start();

func initialize():
	
	pass;

func spawn_random_enemy():
	## Get random enemy type and difficulty
	var random_enemy_type = Util.EnemyTypes.values()[randi_range(0, Util.EnemyTypes.size() - 1)];
	var random_enemy_difficulty = Util.EnemyDifficulties.values()[randi_range(0, Util.EnemyDifficulties.size() - 1)];
	
	## Get enemy instance
	var new_enemy = enemy_manager.create_enemy(Util.EnemyTypes.TRACKER, random_enemy_difficulty);
	
	## Add enemy to the tree
	get_tree().root.add_child(new_enemy);
	new_enemy.initialize();
	new_enemy.global_position = Vector2(randi_range(-1280 + 50, 0 - 50), randi_range(-720 + 50, 0 - 50));

func spawn_bullet():
	
	pass;

func load_level_data():
	
	pass;

func _on_start_timeout():
	enemy_cooldown_timer.start();
	wave_timer.start();

func _on_enemy_cooldown_timeout():
	spawn_random_enemy();

func _on_wave_timeout():
	enemy_cooldown_timer.stop();
	break_timer.start();

func _on_break_timeout():
	
	pass;
