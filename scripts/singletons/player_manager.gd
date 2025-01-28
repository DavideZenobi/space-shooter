extends Node

var player: CharacterBody2D;

func set_player(player: CharacterBody2D):
	self.player = player;

func get_player_position():
	return player.global_position;
