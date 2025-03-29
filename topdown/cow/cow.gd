extends CharacterBody2D
var direction = -1
var speed = 100
var move_idle = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move_idle:
		velocity.x = direction * speed
	move_and_slide()
	if velocity.x !=0:
		if velocity.x<0:
			$Ani_cow.play("run_cow")
			$Ani_cow.flip_h=true
		else:
			$Ani_cow.flip_h=false
	else:
		$Ani_cow.play("idie_cow")
	pass

func _on_timer_timeout() -> void:
	move_idle = false
	velocity.x=0
	$Ani_cow.play("idie_cow")
	await get_tree().create_timer(3).timeout
	direction*=-1
	pass # Replace with function body.
