extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent;
@onready var health_bar: TextureProgressBar = $EnemyHealthBar;

var speed = 300.0
var direction: Vector2 = Vector2.LEFT;

func _ready():
	
	pass;

func _physics_process(delta):
	return;
	velocity = Vector2(direction.x * speed, direction.y * speed);
	move_and_slide();
