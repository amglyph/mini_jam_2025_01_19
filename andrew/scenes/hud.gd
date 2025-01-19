extends CanvasLayer

func update_score(score):
	$ScoreLabel.text = str(score)

func update_light_battery_bar(light_battery):
	$LightBattery.value = light_battery
	
func update_pulse_battery_bar(pulse_battery):
	$PulseBattery.value = pulse_battery
	
