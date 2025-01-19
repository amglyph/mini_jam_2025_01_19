extends Node2D

var score := 0
var light_battery := 100
var pulse_battery := 0

func _on_score_timer_timeout() -> void:
	$HUD.update_score(score)

func _on_monster_monster_killed() -> void:
	score += 1

func _on_light_battery_timer_timeout() -> void:
	if $Player/Light.visible:
		light_battery = clamp(light_battery - 0.01, 0, 100)
	else:
		light_battery = clamp(light_battery + 0.01, 0, 100)
		
	$HUD.update_light_battery_bar(light_battery)
	
func _on_pulse_battery_timer_timeout() -> void:
	pulse_battery = clamp(pulse_battery + 0.01, 0, 100)
	$HUD.update_pulse_battery_bar(light_battery)
