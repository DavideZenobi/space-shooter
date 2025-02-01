class_name TrackerEnemy extends Enemy

enum States {IDLE, MOVING_TO_TARGET, TRACKING, ATTACKING};

var state : States = States.MOVING_TO_TARGET;
var target_position: Vector2;
var direction: Vector2;

func _ready():
	target_position = Vector2(randi_range(0, 1920), randi_range(0, 1080));

func _physics_process(delta):
	look_at(PlayerManager.get_player_position());
	return;
	if state == States.MOVING_TO_TARGET:
		look_at(target_position);
		direction = (target_position - global_position).normalized();
		##velocity = direction * enemy_data.speed;
		##move_and_slide();
		if global_position.distance_to(target_position) < 10.0:
			state = States.TRACKING;
		
	elif state == States.TRACKING:
		look_at(PlayerManager.get_player_position());
	elif state == States.ATTACKING:
		pass;
