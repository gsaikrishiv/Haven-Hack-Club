extends Area2D

var t = 0.0
var speed = 110.0
var dead = false

func _ready():
	add_to_group("hittable")
	t = randf() * 10.0
	speed = randf_range(90, 150)

func _physics_process(delta):
	t += delta
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	var to_player = global_position.direction_to(player.global_position)
	var wobble = Vector2(-to_player.y, to_player.x) * sin(t * 6.0) * 120.0
	global_position += (to_player * speed + wobble) * delta

func _draw():
	draw_circle(Vector2(0, -8), 13, Color(0.6, 0.95, 1.0))
	draw_colored_polygon(PackedVector2Array([
		Vector2(-30, 0), Vector2(-18, -8), Vector2(18, -8),
		Vector2(30, 0), Vector2(18, 8), Vector2(-18, 8)]), Color(0.55, 0.55, 0.7))
	draw_circle(Vector2(-14, 0), 3, Color.YELLOW)
	draw_circle(Vector2(0, 0), 3, Color.YELLOW)
	draw_circle(Vector2(14, 0), 3, Color.YELLOW)

func take_damage():
	if dead:
		return
	dead = true
	get_tree().call_group("main", "ufo_killed")
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage()
		take_damage()
