class_name Bullet extends Node

var damage: int;
var speed: int;

var has_collided: bool = false;

func _on_area_entered(area: Area2D):
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	area.get_parent().get_node("HealthComponent").damage(attack);
	
	has_collided = true;
	queue_free();

func _on_screen_exited():
	queue_free();
