extends Node2D

@export var speed = 3000;
@export var direction = Vector2(0, -1);
@export var damage: int = 10;

var has_collided: bool = false;

func _physics_process(delta: float) -> void:
	global_transform.origin += direction * speed * delta;

func _on_screen_exited():
	queue_free();

func _on_hitbox_area_entered(area):
	if has_collided:
		return;
	
	
	queue_free();

func _on_body_entered(body: Node2D):
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	body.get_node("HealthComponent").damage(attack);
	
	has_collided = true;
	queue_free();
