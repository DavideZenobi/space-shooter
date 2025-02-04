extends Node

enum Characters {
	PLAYER,
	ENEMY,
	NPC,
}

enum Levels {
	LEVEL_1,
	LEVEL_2,
	LEVEL_3,
	LEVEL_4,
}

enum LevelPhases {
	INTRO,
	ONGOING,
	WAVE,
	BOSS,
}

enum PlayerTypes { BASIC }

enum PlayerStates {
	NORMAL,
	INVINCIBLE,
}

enum PlayerEvents {
	SHOOT,
	DAMAGE_TAKEN,
	HEALING_TAKEN,
	POWER_UP_TAKEN,
	DIE,
}

enum Backgrounds {
	BASIC,
}

enum EnemyTypes {
	LIGHTWEIGHT,
	TRACKER,
	TANK,
	BOMBARDIER,
}

enum AttackTypes {
	BULLET,
	SHIP,
}

enum PlayerBullets {
	BASIC,
	
}

enum EnemyBullets {
	BASIC,
	
}

enum EnemyDifficulties {
	EASY,
	MEDIUM,
	HARD,
}

enum EnemyBehaviour {
	SOLO,
	PATROL,
}

enum EnemyStates {
	IDLE,
	MOVING_TO_TARGET,
	TRACKING,
	ATTACKING,
	PATROLLING,
}
