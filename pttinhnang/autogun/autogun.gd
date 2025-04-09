extends CharacterBody2D

var which_2 = null
var bullet_scene = preload("res://gun/gun.tscn")


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	move_and_slide()
	

func fire(kt : bool):
	var mark2d=[$Marker2D,$Marker2D2]


	# ia vòng tròn thành 3 phần đều 120 độ
	var directions = [
		Vector2.RIGHT.rotated(deg_to_rad(-60.0)),  # lệch -60 độ
		Vector2.RIGHT,                             # đi thẳng phải
		Vector2.RIGHT.rotated(deg_to_rad(60.0))    # lệch 60 độ
	]
	for mark in mark2d:
		for dir in directions:
			var bullet = bullet_scene.instantiate()
			bullet.position = mark.global_position
			if kt:
				bullet.direction = -dir	
			else :
				bullet.direction = dir
			get_parent().add_child(bullet)
			await get_tree().create_timer(0.5).timeout



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="player":
		if body.global_position>global_position:
			$Marker2D.position.x =abs($Marker2D.position.x) #Di chuyển sang phải
			$spi_autogun.flip_h=false
			fire(false)
		else:
			$Marker2D.position.x =-abs($Marker2D.position.x) #Di chuyển sang phải
			$spi_autogun.flip_h=true
			fire(true)
	pass # Replace with function body.
