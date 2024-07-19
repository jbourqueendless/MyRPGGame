extends AnimatedSprite2D


func _physics_process(delta):
	var player = get_parent()
	if player:
		if player.velocity == Vector2(0,0):
			play("idle")
		else:
			if player.velocity.x != 0:
				flip_h = player.velocity.x < 0
			play("walk")
