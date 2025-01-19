extends Area2D

signal monster_killed

func kill_self() -> void:
	emit_signal("monster_killed")
	queue_free()
