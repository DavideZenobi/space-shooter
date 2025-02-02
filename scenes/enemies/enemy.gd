class_name Enemy extends Node2D

var enemy_data: EnemyData;

@onready var sprite: Sprite2D = $Sprite2D;
@onready var area: Area2D = $Hitbox;
@onready var collision_shape: CollisionShape2D = $Hitbox/CollisionShape2D;
@onready var bullet_spawn: Marker2D = $BulletSpawn;
@onready var health_component: HealthComponent = $HealthComponent;
@onready var health_bar: EnemyHealthBar = $EnemyHealthBar;

func set_data(new_enemy_data: EnemyData):
	enemy_data = new_enemy_data;

func initialize():
	sprite.texture = enemy_data.sprite;
	collision_shape.shape = RectangleShape2D.new();
	match enemy_data.type:
		Util.EnemyTypes.LIGHTWEIGHT:
			collision_shape.shape.size = Vector2(93, 84);
		Util.EnemyTypes.TRACKER:
			collision_shape.shape.size = Vector2(104, 84);
		Util.EnemyTypes.TANK:
			collision_shape.shape.size = Vector2(103, 84);
		Util.EnemyTypes.BOMBARDIER:
			collision_shape.shape.size = Vector2(82, 84);
	
	health_component.initialize(enemy_data.health);
	health_bar.initialize(health_component);

func hitted(attack: Attack):
	health_component.damage(attack);
