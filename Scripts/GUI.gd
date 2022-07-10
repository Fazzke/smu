extends CanvasLayer

func _ready():
	Global.GUI = self
	get_node("Heart").visible = false
	get_node("Lung").visible = false
	get_node("Brain").visible = true
	
func update_GUI(coins, lives):
	if lives == 3:
		get_node("Heart").visible = false
		get_node("Lung").visible = false
		get_node("Brain").visible = true
	if lives == 2:
		get_node("Heart").visible = false
		get_node("Lung").visible = true
		get_node("Brain").visible = false
	if lives == 1:
		get_node("Heart").visible = true
		get_node("Lung").visible = false
		get_node("Brain").visible = false

	get_node("Coin").text = str(coins)
	
#func animate(animation):
#	get_node("AnimationPlayer").play(animation)

