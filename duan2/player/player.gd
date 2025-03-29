extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_attack= false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():

		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("attack") and not is_attack:
		is_attack = true
		$AnimatedSprite2D.play("attack")
		await $AnimatedSprite2D.get_tree().create_timer(1).timeout
		$AnimatedSprite2D.stop()
		is_attack = false


	var direction := Input.get_axis("ui_left", "ui_right")
	if not  is_attack:
		if direction:
			velocity.x = direction * SPEED
			if is_on_floor() :
				$AnimatedSprite2D.play("run")
			else:
				$AnimatedSprite2D.play("jump")
			if velocity.x<0:
				$AnimatedSprite2D.flip_h=true
			else:
				$AnimatedSprite2D.flip_h=false
		else:
			$AnimatedSprite2D.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y < 0:
				$AnimatedSprite2D.play("jump")
	

		

		
	move_and_slide()

		




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="CharacterBody2D3":
		Global.dame = true
pass # Replace with function body.
