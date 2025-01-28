extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent;
@onready var health_bar: TextureProgressBar = $EnemyHealthBar;

enum States {MOVING_TO_TARGET, TRACKING, ATTACKING};

var state : States = States.MOVING_TO_TARGET;
var target_position: Vector2 = Vector2(300, 300);
var player_position: Vector2;
var max_health: int = 50;
var speed = 300.0
var direction: Vector2;

func initialize(target_position: Vector2):
	self.target_position = target_position;

func _ready():
	health_component.initialize(max_health);
	health_bar.initialize(health_component);


func _physics_process(delta):
	if state == States.MOVING_TO_TARGET:
		look_at(target_position);
		direction = (target_position - global_position).normalized();
		velocity = direction * speed;
		move_and_slide();
		if global_position.distance_to(target_position) < 2.0:
			state = States.TRACKING;
		
	elif state == States.TRACKING:
		look_at(PlayerManager.get_player_position());
	elif state == States.ATTACKING:
		pass;
