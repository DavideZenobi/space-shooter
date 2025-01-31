extends Node

enum Levels {
	LEVEL_1,
	LEVEL_2,
	LEVEL_3,
	LEVEL_4,
}

enum PlayerTypes { BASIC }

enum Backgrounds {
	BASIC,
}

enum EnemyTypes {
	LIGHTWEIGHT,
	TRACKER,
	TANK,
	BOMBARDIER,
}

enum EnemyDifficulties {
	EASY,
	MEDIUM,
	HARD,
}

enum EnemyStates {
	IDLE,
	MOVING_TO_TARGET,
	TRACKING,
	ATTACKING,
	PATROLLING,
}
