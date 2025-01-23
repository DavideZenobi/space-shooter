extends Node2D

@export var speed = 500;
@export var direction = Vector2(0, -1);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	return;
	position += direction * speed * delta;
	
	var viewport_rect = get_viewport_rect();
	if position.x < viewport_rect.position.x or position.x > viewport_rect.position.x or position.y < viewport_rect.position.y or position.y > viewport_rect.y:
		queue_free();

func _on_screen_exited():
	queue_free();
