extends CharacterBody2D

@export var max_health: int = 100;
@export var speed: int = 800;
@export var back_speed: int = 500;
var direction: Vector2;
@export var current_bullet: PackedScene;
@export var fire_rate: float = 0.08;
var time_since_last_shoot: float = 0.0;
@export var max_ammo: int = 100;
var current_ammo: int;

var screen_size: Vector2;

@onready var audio_shoot: AudioStreamPlayer2D = $AudioShoot;
@onready var health_component: HealthComponent = $HealthComponent;

func _ready():
	SceneManager.player = self;
	screen_size = get_viewport_rect().size;
	health_component.initialize(max_health);
	current_ammo = max_ammo;

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
		audio_shoot.play();
		time_since_last_shoot = fire_rate;
		current_ammo -= 1;
		print(current_ammo)
	
	if time_since_last_shoot > 0:
		time_since_last_shoot = clamp(time_since_last_shoot - delta, 0, fire_rate);

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

func refill_ammo():
	
	pass;
