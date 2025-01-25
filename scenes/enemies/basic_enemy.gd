extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent;
@onready var health_bar: TextureProgressBar = $EnemyHealthBar;
@onready var basic_enemy_hitbox: Node = $BasicEnemyHitbox;

var speed = 300.0
var direction: Vector2 = Vector2.LEFT;

func _ready():
	health_bar.initialize(health_component);
	basic_enemy_hitbox.initialize(health_component);

func _physics_process(delta):
	return;
	velocity = Vector2(direction.x * speed, direction.y * speed);
	move_and_slide();
