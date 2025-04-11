extends CharacterBody2D

@export var speed: float = 400.0
var direction = null

func _physics_process(delta):

	velocity = direction * speed
	rotation = velocity.angle()

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Global.is_live = true
		queue_free()
	pass # Replace with function body.
