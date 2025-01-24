extends CharacterBody2D


var speed = 300.0
var direction: Vector2 = Vector2.LEFT;

func _physics_process(delta):
	velocity = Vector2(direction.x * speed, direction.y * speed);
	move_and_slide();
