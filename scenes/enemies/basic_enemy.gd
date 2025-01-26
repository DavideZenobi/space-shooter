extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent;
@onready var health_bar: TextureProgressBar = $EnemyHealthBar;
@onready var basic_hitbox: Node = $BasicHitbox;

var max_health: int = 50;
var speed = 300.0
var direction: Vector2 = Vector2.LEFT;

func _ready():
	health_component.initialize(max_health);
	health_bar.initialize(health_component);
	basic_hitbox.initialize(health_component);

func _physics_process(delta):
	return;
	velocity = Vector2(direction.x * speed, direction.y * speed);
	move_and_slide();
