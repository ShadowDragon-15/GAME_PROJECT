extends CharacterBody2D

var direction = -1  # Hướng di chuyển của cây
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_attack: bool = true
var bullet = preload("res://mushroom/mushroom_shoot/mushroomshot.tscn")
var bullet_speed = 1000

func _physics_process(delta: float) -> void:
	# Đảo hướng sprite nếu cần
	$Ani_mushroom.flip_h = direction == -1
	
	# Áp dụng trọng lực
	if not is_on_floor():
		velocity.y += 20  # Điều chỉnh trọng lực nếu cần

	move_and_slide()
func fire():
	var bullet = preload("res://mushroom/mushroom_shoot/mushroomshot.tscn")
	var new_bollet = bullet.instantiate()
	new_bollet.position = $dealzone/Marker2D.global_position  # Đặt đạn ở vị trí cây nấm
	get_parent().add_child(new_bollet)

func _on_dealzone_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		$Ani_mushroom.play("attack")
		fire()
