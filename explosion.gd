extends Node2D

var radius = 90.0

func _ready():
	get_tree().call_group("camera", "shake", 8)
	var t = create_tween()
	t.tween_property(self, "modulate:a", 0.0, 0.4)
	t.tween_callback(queue_free)
	await get_tree().create_timer(0.1).timeout
	for unit in get_tree().get_nodes_in_group("hittable"):
		if unit.global_position.distance_to(global_position) <= radius:
			unit.take_damage()

func _draw():
	draw_circle(Vector2.ZERO, radius, Color(1, 0.8, 0.2, 0.85))
	draw_circle(Vector2.ZERO, radius * 0.6, Color(1, 0.4, 0.1, 0.9))
