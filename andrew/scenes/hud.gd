extends CanvasLayer

func _ready() -> void:
	$LightBattery.get("theme_override_styles/fill").bg_color = Color.WHITE
	$LightBattery.get("theme_override_styles/background").bg_color = Color.DIM_GRAY
	$PulseBattery.get("theme_override_styles/fill").bg_color = Color.WHITE
	$PulseBattery.get("theme_override_styles/background").bg_color = Color.DIM_GRAY
	
func update_score(score):
	$ScoreLabel.text = str(score)

func update_light_battery_bar(light_battery, light_on_cooldown):
	$LightBattery.value = light_battery
	
	if light_on_cooldown:
		$LightBattery.get("theme_override_styles/fill").bg_color = Color.RED
	else:
		$LightBattery.get("theme_override_styles/fill").bg_color = Color.WHITE
	
func update_pulse_battery_bar(pulse_battery):
	$PulseBattery.value = pulse_battery
	
