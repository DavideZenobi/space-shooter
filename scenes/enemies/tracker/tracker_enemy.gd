class_name TrackerEnemy extends CharacterBody2D

var enemy_data: EnemyData;

enum States {MOVING_TO_TARGET, TRACKING, ATTACKING};

var state : States = States.MOVING_TO_TARGET;
var target_position: Vector2;
var player_position: Vector2;
var direction: Vector2;

func initialize(new_enemy_data: EnemyData, target_position: Vector2):
	self.enemy_data = new_enemy_data;
	self.target_position = target_position;
	## set sprite
	## set collisionshape

func _physics_process(delta):
	if state == States.MOVING_TO_TARGET:
		look_at(target_position);
		direction = (target_position - global_position).normalized();
		velocity = direction * enemy_data.speed;
		move_and_slide();
		if global_position.distance_to(target_position) < 10.0:
			state = States.TRACKING;
		
	elif state == States.TRACKING:
		look_at(PlayerManager.get_player_position());
	elif state == States.ATTACKING:
		pass;
