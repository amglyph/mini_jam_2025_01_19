extends CharacterBody2D

@export var min_speed := 0.1
@export var max_speed := 1
var speed := randf_range(min_speed, max_speed)
var game_over := false
signal monster_killed

func _process(delta: float) -> void:
	if !game_over:
		var direction = Vector2(get_parent().get_node("Player").position) - position
		look_at(position + direction)
		velocity = direction * speed
		move_and_slide()
	
func kill_self() -> void:
	emit_signal("monster_killed")
	queue_free()

func _on_level_game_over() -> void:
	game_over = true
