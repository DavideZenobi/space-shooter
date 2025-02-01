class_name EnemyManager extends Node

func create_enemy(enemy_type: Util.EnemyTypes, enemy_difficulty: Util.EnemyDifficulties) -> Enemy:
	var enemy_scene = SceneManager.get_enemy_scene(enemy_type);
	var enemy_resource = ResourcesDatabase.enemies[enemy_type][enemy_difficulty];
	var enemy_instance = enemy_scene.instantiate();
	enemy_instance.set_data(enemy_resource);
	return enemy_instance;
