extends Node2D

@export var monster_scene : PackedScene
var score := 0
signal game_over

func _process(delta: float) -> void:
	$HUD.update_light_battery_bar($Player.light_battery, $Player.light_on_cooldown)
	$HUD.update_pulse_battery_bar($Player.pulse_battery)

func _on_score_timer_timeout() -> void:
	$HUD.update_score(score)

func _on_monster_monster_killed() -> void:
	score += 1

func _on_player_player_killed() -> void:
	$ScoreTimer.stop()
	$MonsterSpawnTimer.stop()
	emit_signal("game_over")
	$HUD/GameOver.visible = true

func _on_monster_spawn_timer_timeout() -> void:
	$MonsterPath/MonsterSpawn.set_progress(randi())
	var monster = monster_scene.instantiate()
	monster.position = $MonsterPath/MonsterSpawn.position
	add_child(monster)
	monster.monster_killed.connect(_on_monster_monster_killed)
	game_over.connect(monster._on_level_game_over)
