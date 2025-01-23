extends Node

var player: CharacterBody2D;

func spawn_player_bullet(bullet_scene, position):
	var scene_instance = bullet_scene.instantiate();
	get_tree().current_scene.add_child(scene_instance);
	player.add_child(scene_instance);
	scene_instance.global_transform.origin = position;
	print("Bullet of type: ", bullet_scene, " created");
