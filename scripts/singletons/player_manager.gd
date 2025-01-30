extends Node

var player: CharacterBody2D;

func set_player(new_player: CharacterBody2D):
	self.player = new_player;

func get_player_position():
	return player.global_position;
