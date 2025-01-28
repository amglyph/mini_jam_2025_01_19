extends Node2D

var score := 0

func _process(delta: float) -> void:
	$HUD.update_light_battery_bar($Player.light_battery, $Player.light_on_cooldown)
	$HUD.update_pulse_battery_bar($Player.pulse_battery)

func _on_score_timer_timeout() -> void:
	$HUD.update_score(score)

func _on_monster_monster_killed() -> void:
	score += 1

func _on_monster_spawn_timer_timeout() -> void:
	pass # Replace with function body.
