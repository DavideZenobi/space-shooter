extends Node

var levels: Dictionary = {
	Util.Levels.LEVEL_1: {
		"level_scenes_config": load("res://resources/levels/levels_scene_config/level_1_scenes_config.tres"),
	},
	Util.Levels.LEVEL_2: {
		
	},
}

var enemies: Dictionary = {
	Util.EnemyTypes.LIGHTWEIGHT: {
		Util.EnemyDifficulties.EASY: load("res://resources/enemies/lightweight_easy.tres"),
		Util.EnemyDifficulties.MEDIUM: load("res://resources/enemies/lightweight_medium.tres"),
		Util.EnemyDifficulties.HARD: load("res://resources/enemies/lightweight_hard.tres"),
	},
	Util.EnemyTypes.TRACKER: {
		Util.EnemyDifficulties.EASY: load("res://resources/enemies/tracker_easy.tres"),
		Util.EnemyDifficulties.MEDIUM: load("res://resources/enemies/tracker_medium.tres"),
		Util.EnemyDifficulties.HARD: load("res://resources/enemies/tracker_hard.tres"),
	},
}

func get_level_scenes_config(level_number: Util.Levels) -> Resource:
	return levels.get(level_number).get("level_scenes_config");
