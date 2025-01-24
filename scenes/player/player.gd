extends CharacterBody2D

var speed: int = 500;
var back_speed: int = 300;
var direction: Vector2;
@export var current_bullet: PackedScene;
@export var fire_rate: float = 0.1;
var time_since_last_shoot: float = 0.0;

var screen_size: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	SceneManager.player = self;
	screen_size = get_viewport_rect().size;

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
	
	position.x = clamp(position.x, 0 + 50, screen_size.x - 50);
	position.y = clamp(position.y, 0 + 50, screen_size.y - 50);
	
	if Input.is_action_pressed("shoot") and time_since_last_shoot <= 0:
		SceneManager.spawn_player_bullet(current_bullet, $BulletSpawnMark.global_transform.origin);
		time_since_last_shoot = fire_rate;
		print("Player position: ", global_transform.origin);
	else:
		time_since_last_shoot -= delta;
	

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
