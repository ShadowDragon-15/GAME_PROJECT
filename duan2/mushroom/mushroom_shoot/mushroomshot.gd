extends CharacterBody2D

@export var speed: float = 400.0
var direction: Vector2 = Vector2.RIGHT  # mặc định bắn sang phải

func _physics_process(delta):
	$AnimatedSprite2D.flip_h=true
	velocity = -direction * speed
	move_and_slide()
