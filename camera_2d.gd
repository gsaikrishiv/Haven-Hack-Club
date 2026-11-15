extends Camera2D

func _ready():
	add_to_group("camera")

func shake(strength):
	var t = create_tween()
	for i in 6:
		t.tween_property(self, "offset", Vector2(randf_range(-strength, strength), randf_range(-strength, strength)), 0.03)
	t.tween_property(self, "offset", Vector2.ZERO, 0.03)
