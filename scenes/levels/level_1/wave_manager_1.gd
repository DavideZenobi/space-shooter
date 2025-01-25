extends Node2D

@export var waves_total_number: int = 5;

var current_wave: int = 1;

func _ready():
	start();

func start():
	$StartTimer.start(5);

func _on_start_timer_timeout():
	$IntervalTimer.start(1);
	print("START");

func _on_interval_timer_timeout():
	if current_wave >= waves_total_number:
		$IntervalTimer.stop();
	else:
		current_wave += 1;
		print("Current wave: ", current_wave);
