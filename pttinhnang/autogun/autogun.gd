extends CharacterBody2D
var bullet_path = preload("res://gun/gun.tscn")




const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	move_and_slide()
	
func fire(direction: int):
	var bullet = bullet_path.instantiate()
	bullet.global_position=$Marker2D.global_position
	get_parent().add_child(bullet)
	bullet.direction = direction
	
	

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="player":
		print(abs($Marker2D.position.x))
		if body.global_position>global_position:
			$spi_autogun.flip_h=false
			fire(1)
		else:
			$Marker2D.position.x =-abs($Marker2D.position.x) #Di chuyển sang phải
			$spi_autogun.flip_h=true
			fire(-1)
	pass # Replace with function body.
