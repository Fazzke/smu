extends AnimatedSprite

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up()
		#get_node("AudioStreamPlayer").play()
		get_node("AnimationPlayer").play("die")
	
func die():
	queue_free()
