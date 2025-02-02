extends Node

var levels: Dictionary = {
	Util.Levels.LEVEL_1: "res://scenes/levels/level_1/level_1.tscn"
};

var enemies: Dictionary = {
	Util.EnemyTypes.LIGHTWEIGHT: "res://scenes/enemies/lightweight/lightweight_enemy.tscn",
	Util.EnemyTypes.TRACKER: "res://scenes/enemies/tracker/tracker_enemy.tscn",
};

var player_bullets: Dictionary = {
	Util.PlayerBullets.BASIC: "",
}

var enemy_bullets: Dictionary = {
	Util.EnemyBullets.BASIC: "res://scenes/bullets/enemy/basic/enemy_basic_bullet.tscn",
};
