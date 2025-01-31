extends Node

var current_level: Util.Levels;

@export var enemy_total_quantity: int;

@onready var start_timer: Timer = $Start;
@onready var enemy_cooldown_timer: Timer = $EnemyCooldown;
@onready var wave_timer: Timer = $Wave;
@onready var break_timer: Timer = $Break;

func spawn_enemy():
	var new_enemy = SceneManager.get_enemy_scene(Util.EnemyTypes.TRACKER);
	pass;

func load_level_data():
	
	pass;

func _on_enemy_cooldown_timeout():
	spawn_enemy();

func _on_start_timeout():
	enemy_cooldown_timer.start();
	wave_timer.start();

func _on_wave_timeout():
	enemy_cooldown_timer.stop();
	break_timer.start();

func _on_break_timeout():
	
	pass;
