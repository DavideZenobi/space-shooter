extends Node

var levels: Dictionary = {
	Util.Levels.LEVEL_1: {
		"level_scenes_config": load("res://resources/levels/levels_scene_config/level_1_scenes_config.tres"),
	},
	Util.Levels.LEVEL_2: {
		
	},
}

func get_level_scenes_config(level_number: Util.Levels) -> Resource:
	return levels.get(level_number).get("level_scenes_config");
