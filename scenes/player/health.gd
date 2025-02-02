class_name PlayerHealth extends Node

signal health_changed;
signal damage_taken;
signal healing_taken;

var max_health: int;
var current_health: int;

func initialize(new_max_health: int):
	max_health = new_max_health
	current_health = new_max_health;

func damage(attack: Attack):
	current_health -= attack.damage;
	health_changed.emit();
	damage_taken.emit();
	
	if current_health <= 0:
		get_parent().queue_free();

func heal(heal: int):
	current_health += heal;
	health_changed.emit();
	healing_taken.emit();
	
	if current_health > max_health:
		current_health = max_health;
