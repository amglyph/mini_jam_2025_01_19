extends Area2D

@export var speed := 750

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	
func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("killable"):
		area.kill_self()
		queue_free()


func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("walls"):
		queue_free()
