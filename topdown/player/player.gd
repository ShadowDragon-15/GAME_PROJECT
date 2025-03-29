extends CharacterBody2D
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func control_direction():
	var Movedirection=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = Movedirection * speed
	if Movedirection == Vector2.ZERO:
		$player.stop()
	else:
		_play_animated(Movedirection)
func _process(delta: float) -> void:
	control_direction()
	move_and_slide()
	pass
func _play_animated(dir: Vector2):
	match dir:
		Vector2(1,0): $player.play("aniright")
		Vector2(-1,0): $player.play("anileft")
		Vector2(0,-1): $player.play("aniup")
		Vector2(0,1): $player.play("anidown")
