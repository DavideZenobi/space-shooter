extends Node

func create_enemy(enemy_type: Util.EnemyTypes):
	return SceneManager.get_enemy_scene(enemy_type);
	
