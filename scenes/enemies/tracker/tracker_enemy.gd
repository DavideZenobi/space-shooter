class_name TrackerEnemy extends Enemy

enum States {IDLE, MOVING_TO_TARGET, TRACKING, ATTACKING};

var state : States = States.IDLE;
var target_position: Vector2;
var direction: Vector2;

@onready var start_moving_timer: Timer = $StartMoving;
@onready var shoot_timer: Timer = $Shoot;

func _ready():
	target_position = Vector2(randi_range(0, 1920), randi_range(0, 1080));
	start_moving_timer.start();

func _physics_process(delta):
	match state:
		States.IDLE:
			look_at(target_position);
		States.MOVING_TO_TARGET:
			look_at(target_position);
			direction = (target_position - global_position).normalized();
			position += direction * enemy_data.speed * delta;
			if global_position.distance_to(target_position) < 10.0:
				change_state(States.TRACKING);
				shoot_timer.start();
		States.TRACKING:
			look_at(PlayerManager.get_player_position());
		States.ATTACKING:
			pass;

func shoot():
	SceneManager.spawn_enemy_bullet(enemy_data.bullet, bullet_spawn.global_position, rotation);
	pass;

func change_state(new_state: States):
	state = new_state;
	pass;

func _on_shoot_timeout():
	shoot();

func _on_start_moving_timeout() -> void:
	change_state(States.MOVING_TO_TARGET);
