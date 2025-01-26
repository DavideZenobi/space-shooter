extends Node2D
class_name HealthComponent;

signal health_changed;

@export var max_health: int;
var current_health: int;

func initialize(max_health: int):
	self.max_health = max_health
	current_health = max_health;

func damage(attack: Attack):
	current_health -= attack.damage;
	health_changed.emit();
	
	if current_health <= 0:
		get_parent().queue_free();
