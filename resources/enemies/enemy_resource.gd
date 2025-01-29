extends Resource;
class_name EnemyType;

enum Types {
	LIGHTWEIGHT,
	TRACKER,
	TANK,
	BOMBARDIER
};

enum Difficulties {
	EASY,
	MEDIUM,
	HARD,
};

@export var type: Types;
@export var difficulty: Difficulties;
@export var sprite: Texture;
@export var health: int;
@export var damage: int;
@export var speed: int;
