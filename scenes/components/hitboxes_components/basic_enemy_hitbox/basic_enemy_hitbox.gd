extends Node

var health_component: HealthComponent;

func initialize(health_component: HealthComponent):
	self.health_component = health_component;

func _on_hitbox_area_entered(area: Area2D):
	var attack = Attack.new();
	attack.damage = area.get_parent().attack_damage;
	health_component.damage(attack);
