extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bullet_1 = preload("res://gun/gun.tscn")

func shoot():
	var bullet = bullet_1.instantiate()
	
	var mouse_pos = get_global_mouse_position()
	var dir = (mouse_pos - global_position).normalized()
	
	bullet.position = $Marker2D.global_position   # spawn phía trước mặt
	bullet.direction = dir
	
	get_parent().add_child(bullet)
	
	
func _input(event):
	if event is InputEventMouseButton:  # hoặc event is InputEventMouseButton
		shoot() 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	if Global.is_live and $colli_player:
		$colli_player.queue_free()
		

	
	
		

		
