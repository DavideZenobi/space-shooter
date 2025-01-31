extends Node

var current_level: Util.Levels;

@export var enemy_total_quantity: int;

@onready var start_timer: Timer = $Start;
@onready var enemy_cooldown_timer: Timer = $EnemyCooldown;
@onready var wave_timer: Timer = $Wave;
@onready var break_timer: Timer = $Break;

func _ready():
	start_timer.start();

func spawn_random_enemy():
	var random_enemy_type = Util.EnemyTypes.values()[randi_range(0, Util.EnemyTypes.size() - 1)];

	if random_enemy_type != Util.EnemyTypes.TRACKER:
		return;
	var new_enemy_scene = SceneManager.get_enemy_scene(random_enemy_type);
	var new_enemy = new_enemy_scene.instantiate();
	get_tree().root.add_child(new_enemy);
	new_enemy.global_position = Vector2(randi_range(0, 1920), randi_range(0, 1080));

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
