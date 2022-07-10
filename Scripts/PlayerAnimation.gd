extends AnimatedSprite

func update_child(motion):
	if motion.y < 0:
		play("idle")
	elif motion.x > 0:
		flip_h = false
		play("runright")
	elif motion.x < 0:
		play("runright")
		flip_h = true
	elif(Input.is_action_pressed("ui_hit")):
		play("hitright")
	else:
		flip_h = false
		play("ohrenbohren")
	
