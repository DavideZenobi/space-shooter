extends CharacterBody2D

var speed: int = 500;
var back_speed: int = 300;
var direction: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	get_movement_input();
	if direction.y > 0:
		velocity = Vector2(direction.x * speed, direction.y * back_speed);
	else:
		velocity = Vector2(direction.x * speed, direction.y * speed);
	
	move_and_slide();

func get_movement_input():
	direction = Vector2.ZERO;
	if Input.is_action_pressed("move_left"):
		direction.x -= 1;
	if Input.is_action_pressed("move_right"):
		direction.x += 1;
	if Input.is_action_pressed("move_up"):
		direction.y -= 1;
	if Input.is_action_pressed("move_down"):
		direction.y += 1;
	
	direction = direction.normalized();
