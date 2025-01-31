extends Node

var loaded_scenes = {
	enemies = {},
	items = {},
	bullets = {},
};
var current_scene: PackedScene;

func _ready():
	preload_level_scenes(Util.Levels.LEVEL_1);

func spawn_player_bullet(bullet_scene, position, rotation):
	var scene_instance = bullet_scene.instantiate();
	get_tree().current_scene.add_child(scene_instance);
	scene_instance.global_transform.origin = position;
	scene_instance.rotation = rotation;
	##print("Bullet of type: ", bullet_scene, " created");

func preload_level_scenes(level_number: Util.Levels):
	var level_scenes_config = ResourcesDatabase.get_level_scenes_config(level_number);
	
	for enemy_type in level_scenes_config.enemy_types:
		var enemy_scene_path = ScenesDatabase.enemies[enemy_type];
		loaded_scenes.enemies[enemy_type] = load(enemy_scene_path);
	
	for enemy_type in loaded_scenes.enemies:
		print(enemy_type, " -> ", loaded_scenes.enemies[enemy_type]);
		print(loaded_scenes.enemies[Util.EnemyTypes.LIGHTWEIGHT]);
	

func get_enemy_scene(enemy_type: Util.EnemyTypes) -> PackedScene:
	return loaded_scenes.enemies[enemy_type];
