extends TextureProgressBar

var health_component: HealthComponent;

func initialize(new_health_component: HealthComponent):
	self.health_component = new_health_component;
	value = 100;

func _on_health_changed():
	value = health_component.current_health * 100 / health_component.max_health;
