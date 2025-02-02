class_name Bullet extends Node2D

@export var damage: int;
@export var speed: int;

var has_collided: bool = false;

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta;

func _on_area_entered(area: Area2D):
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	area.get_parent().hitted(attack);
	
	has_collided = true;
	queue_free();

func _on_screen_exited():
	queue_free();
