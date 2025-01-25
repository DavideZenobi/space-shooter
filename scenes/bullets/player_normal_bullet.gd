extends Node2D

@export var speed = 3000;
@export var direction = Vector2(0, -1);
@export var attack_damage: int = 10;

func _physics_process(delta: float) -> void:
	global_transform.origin += direction * speed * delta;

func _on_screen_exited():
	print("Bullet eliminated");
	queue_free();

func _on_hitbox_area_entered(area):
	print("Hitted!");
	queue_free();
