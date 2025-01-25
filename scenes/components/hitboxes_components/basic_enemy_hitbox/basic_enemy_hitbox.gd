extends Node

var health_component: HealthComponent;

func _ready():
	health_component = get_parent().get_node("HealthComponent");

func _on_hitbox_area_entered(area: Area2D):
	var attack = Attack.new();
	attack.damage = area.get_parent().attack_damage;
	health_component.damage(attack);
