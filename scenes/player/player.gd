class_name Player extends CharacterBody2D

var character_type: Util.Characters = Util.Characters.PLAYER;
var state: Util.PlayerStates = Util.PlayerStates.NORMAL;

@export var max_health: int = 100;
@export var speed: int = 800;
var direction: Vector2;
@export var current_bullet: Util.PlayerBullets;
@export var fire_rate: float = 0.08;
var time_since_last_shoot: float = 0.0;
@export var max_ammo: int = 30;
var current_ammo: int;

var screen_size: Vector2;

signal ammo_changed;

@onready var audio: AudioStreamPlayer2D = $Audio;
@onready var health: PlayerHealth = $HealthComponent;
@onready var bullet_manager: Marker2D = $BulletSpawnMark;
@onready var reload_cooldown: Timer = $ReloadCooldown;
@onready var reload: Timer = $Reload;
@onready var invicible_timer: Timer = $Invincible;

func _ready():
	screen_size = get_viewport_rect().size;
	health.initialize(max_health);
	current_ammo = max_ammo;
	current_bullet = Util.PlayerBullets.BASIC;
	PlayerManager.set_player(self);

func _process(delta):
	pass


func _physics_process(delta):
	## Mira al cursor
	var mouse_position = get_global_mouse_position();
	look_at(mouse_position);
	
	## Input
	get_movement_input();
	velocity = Vector2(direction.x * speed, direction.y * speed);
	move_and_slide();
	
	position.x = clamp(position.x, 0 + 50, screen_size.x - 50);
	position.y = clamp(position.y, 0 + 50, screen_size.y - 50);
	
	if Input.is_action_pressed("shoot") and time_since_last_shoot <= 0 and current_ammo > 0:
		shoot();
	
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

func shoot():
	bullet_manager.spawn_bullet(current_bullet, position, rotation);
	time_since_last_shoot = fire_rate;
	current_ammo -= 1;
	reload_cooldown.start();
	reload.stop();
	ammo_changed.emit();
	
	audio.play_by_event(Util.PlayerEvents.SHOOT);

func hitted(attack: Attack) -> void:
	if state == Util.PlayerStates.INVINCIBLE:
		return;
	
	health.damage(attack);
	audio.play_by_event(Util.PlayerEvents.DAMAGE_TAKEN);
	state = Util.PlayerStates.INVINCIBLE;
	invicible_timer.start();

func _start_reloading():
	reload.start();

func _reload_ammo():
	current_ammo += 1;
	if current_ammo == max_ammo:
		reload.stop();
	ammo_changed.emit();

func _on_invincible_timeout():
	state = Util.PlayerStates.NORMAL;
