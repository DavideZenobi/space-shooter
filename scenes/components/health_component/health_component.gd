extends Node2D
class_name HealthComponent;

signal health_changed;

@export var max_health: int = 50;
var current_health: int;

func _ready():
	current_health = max_health;

func damage(attack: Attack):
	current_health -= attack.damage;
	health_changed.emit();
	
	if current_health <= 0:
		get_parent().queue_free();
