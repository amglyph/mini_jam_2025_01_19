extends CharacterBody2D

@export var speed := 500
@export var pulse_scene : PackedScene
var light_battery := 100
var pulse_battery := 0
var light_on_cooldown := false
var player_alive := true
signal player_killed

func _ready() -> void:
	position = Vector2(100, 500)

func _process(delta: float) -> void:
	if player_alive:
		var direction = Input.get_vector("weast", "east", "uppies", "down_bad")
		look_at(position + direction)
		velocity = direction * speed
		move_and_slide()
		
	if Input.is_action_just_pressed("pew_pew") and player_alive:
		if $Light.visible or !$Light.visible and !light_on_cooldown:
			$Light.visible = !$Light.visible
		
		if $Light.visible:
			var overlaps = $Light.get_overlapping_areas()
			
			for i in overlaps:
				if i.is_in_group("monsters"):
					i.get_parent().kill_self()

	if Input.is_action_just_pressed("pew_two") and pulse_battery == 100 and player_alive:
		pulse_battery = 0
		var pulse = pulse_scene.instantiate()
		owner.add_child(pulse)
		pulse.transform = $PulseSpawn.global_transform

func _on_light_battery_timer_timeout() -> void:
	if $Light.visible:
		light_battery = clamp(light_battery - 1, 0, 100)
		
		if light_battery == 0:
			$Light.visible = false
			light_on_cooldown = true
			$LightCooldownTimer.start()
	else:
		light_battery = clamp(light_battery + 1, 0, 100)

func _on_pulse_battery_timer_timeout() -> void:
	pulse_battery = clamp(pulse_battery + 1, 0, 100)

func _on_light_cooldown_timer_timeout() -> void:
	light_on_cooldown = false
	$LightCooldownTimer.stop()

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("monsters"):
		kill_self()

func kill_self() -> void:
	player_alive = false
	$LightBatteryTimer.stop()
	$LightCooldownTimer.stop()
	$PulseBatteryTimer.stop()
	emit_signal("player_killed")
