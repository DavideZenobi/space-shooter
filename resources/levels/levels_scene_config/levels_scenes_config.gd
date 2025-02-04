extends Resource;
class_name LevelSceneConfig;

@export var level_number: Util.Levels;
@export var background: Util.Backgrounds;
@export var player_type: Util.PlayerTypes;
@export var player_bullets_types: Array[Util.PlayerBullets];
@export var enemy_types: Array[Util.EnemyTypes];
@export var enemy_bullets_types: Array[Util.EnemyBullets];
@export var tracker_curves: Array[Curve2D];
@export var lightweight_curves: Array[Curve2D];
## items
