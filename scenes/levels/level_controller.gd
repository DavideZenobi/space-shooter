extends Node

## @onready hud
@onready var player: CharacterBody2D = $Player;
@onready var parallax: Node2D = $Parallax;
@onready var enemy_spawn_system: EnemySpawnSystem = $EnemySpawnSystem;

@onready var intro: Timer = $Intro;
@onready var countdown: Timer = $Countdown;

var level_phase: Util.LevelPhases;

func _ready():
	level_phase = Util.LevelPhases.INTRO;
	intro.start();
	Logger.print_in_console("Intro start!");

func start():
	level_phase = Util.LevelPhases.ONGOING;
	countdown.start();
	Logger.print_in_console("Game start!");

func create_wave():
	var random_enemy_type = Util.EnemyTypes.values()[randi_range(0, Util.EnemyTypes.size() - 1)];
	enemy_spawn_system.spawn(Util.EnemyTypes.TRACKER);

func _on_intro_timeout():
	Logger.print_in_console("Intro finished!");
	start();
	

func _on_countdown_timeout():
	create_wave();
	pass;
