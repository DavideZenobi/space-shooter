extends Node2D

@export var speed = 1000;
@export var direction = Vector2(0, -1);
@export var attack_damage: int = 50;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_transform.origin += direction * speed * delta;

func _on_screen_exited():
	print("Bullet eliminated");
	queue_free();

func _on_hitbox_area_entered(area):
	print("Hitted!");
	queue_free();
