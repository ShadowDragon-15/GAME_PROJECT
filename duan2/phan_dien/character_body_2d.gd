extends CharacterBody2D  # Kế thừa từ CharacterBody2D để có thể di chuyển với physics

var speed = 200
var player: Node2D = null

func _physics_process(delta):
	if Global.dame:
		queue_free()
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

		# Cập nhật animation theo hướng di chuyển
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false  # Nhìn phải
			$AnimatedSprite2D.play("run")  # Chạy animation
		else:
			$AnimatedSprite2D.flip_h = true  # Nhìn trái
			$AnimatedSprite2D.play("run")
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="CharacterBody2D":
		player = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player = null
	pass # Replace with function body.
