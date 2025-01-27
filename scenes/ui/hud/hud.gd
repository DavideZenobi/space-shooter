extends Control

@export var player: CharacterBody2D;

@onready var ammo: Label = $Ammo;


func _ready():
	ammo.text = "Ammo: " + str(player.current_ammo) + " / " + str(player.max_ammo);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_ammo():
	ammo.text = "Ammo: " + str(player.current_ammo) + " / " + str(player.max_ammo);

func _update_health():
	
	pass;
