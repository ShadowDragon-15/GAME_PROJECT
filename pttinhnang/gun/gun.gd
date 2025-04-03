extends CharacterBody2D
var direction = 1
var speed: float = 2

func _ready():
	pass
func _physics_process(delta):
	position.x+=direction*speed
	move_and_slide()
