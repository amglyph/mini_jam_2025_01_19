extends Area2D

@export var speed := 750

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	
func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("monsters"):
		area.get_parent().kill_self()

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area != null and area.is_in_group("borders"):
		queue_free()
