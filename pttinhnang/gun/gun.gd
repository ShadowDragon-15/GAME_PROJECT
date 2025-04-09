extends CharacterBody2D

@export var speed: float = 400.0
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta):

	velocity = direction * speed
	rotation = velocity.angle()

	move_and_slide()
