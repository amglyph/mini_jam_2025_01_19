extends CharacterBody2D

@export var speed := 500

func _ready() -> void:
	position = Vector2(100, 500)

func _process(delta: float) -> void:
	var direction = Input.get_vector("weast", "east", "uppies", "down_bad")
	look_at(position + direction)
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("pew_pew"):
		$Light.visible = !$Light.visible
		
		if $Light.visible:
			var overlaps = $Light.get_overlapping_areas()
			
			for i in overlaps:
				i.kill_self()
				
