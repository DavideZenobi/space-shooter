extends Node

@onready var enemy_spawn_path: Path2D = $EnemySpawnPath;
## @onready hud
@onready var player: CharacterBody2D = $Player;
@onready var parallax: Node2D = $Parallax;

@onready var intro: Timer = $Intro;
@onready var countdown: Timer = $Countdown;

var level_phase: Util.LevelPhases;

func _ready():
	level_phase = Util.LevelPhases.INTRO;
	intro.start();

func start():
	level_phase = Util.LevelPhases.ONGOING;
	

func _on_intro_timeout():
	start();

func _on_countdown_timeout():
	
	pass;
