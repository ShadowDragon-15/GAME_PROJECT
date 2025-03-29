extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	$AnimatedSprite2D.play("idle")
	move_and_slide()
	
