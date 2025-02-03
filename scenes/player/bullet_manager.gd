extends Marker2D

func spawn_bullet(bullet_type: Util.PlayerBullets, player_position: Vector2, player_rotation: float):
	var bullet_scene = SceneManager.get_player_bullet_scene(bullet_type);
	var bullet_instance = bullet_scene.instantiate();
	get_tree().root.add_child(bullet_instance);
	bullet_instance.global_position = player_position;
	bullet_instance.rotation = player_rotation;
