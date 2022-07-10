extends Control

func _ready():
	set_process(true)

func _on_TextureButton_pressed():
	Global.setScene(AllLevelPaths.Level1)

