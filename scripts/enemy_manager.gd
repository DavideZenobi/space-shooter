extends Node

var enemy_scenes = {
	Constants.EnemyTypes.LIGHTWEIGHT: preload("res://scenes/enemies/lightweight/lightweight_enemy.tscn"),
	Constants.EnemyTypes.TRACKER: preload("res://scenes/enemies/tracker/tracker_enemy.tscn"),
};
var enemy_database: EnemyDatabase;

func _ready():
	enemy_database = load("res://resources/enemies/enemy_database.tres");

func spawn_enemy():
	
	pass;
	

func random_enemy():
	
	pass;

func random_difficulty():
	
	pass;
