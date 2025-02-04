extends Node

var loaded_scenes = {
	enemies = {},
	items = {},
	player_bullets = {},
	enemy_bullets = {},
};
var current_scene: PackedScene;

func _ready():
	preload_level_scenes(Util.Levels.LEVEL_1);

func get_player_bullet_scene(bullet_type: Util.PlayerBullets) -> PackedScene:
	return loaded_scenes.player_bullets[bullet_type];

func spawn_enemy_bullet(bullet_type, position, rotation):
	var bullet_scene = loaded_scenes.enemy_bullets[bullet_type];
	var bullet_instance = bullet_scene.instantiate();
	get_tree().current_scene.add_child(bullet_instance);
	bullet_instance.global_position = position;
	bullet_instance.rotation = rotation;

func preload_level_scenes(level_number: Util.Levels):
	var level_scenes_config = ResourcesDatabase.get_level_scenes_config(level_number);
	
	## Load enemies
	for enemy_type in level_scenes_config.enemy_types:
		var enemy_scene_path = ScenesDatabase.enemies[enemy_type];
		loaded_scenes.enemies[enemy_type] = load(enemy_scene_path);
	
	## Load player bullets
	for player_bullet_type in level_scenes_config.player_bullets_types:
		var player_bullet_scene_path = ScenesDatabase.player_bullets[player_bullet_type];
		loaded_scenes.player_bullets[player_bullet_type] = load(player_bullet_scene_path);

	## Load enemy bullets
	for enemy_bullet_type in level_scenes_config.enemy_bullets_types:
		var enemy_bullet_scene_path = ScenesDatabase.enemy_bullets[enemy_bullet_type];
		loaded_scenes.enemy_bullets[enemy_bullet_type] = load(enemy_bullet_scene_path);

func get_enemy_scene(enemy_type: Util.EnemyTypes) -> PackedScene:
	return loaded_scenes.enemies[enemy_type];

func unload_level_scenes():
	## TODO
	## "scene.free()"
	## loaded_scenes.clear()
	pass;
