extends Node2D

export var starting_lives = 3 #shows up in inspector

var lives
var coins = 0

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()

func update_GUI():
	GUI.update_GUI(coins, lives)
	
func hurt():
	lives -= 1
	update_GUI()
	if lives < 0:
		end_game()
	
func coin_up():
	coins += 1
	update_GUI()
	
func end_game():
	Global.setScene(AllLevelPaths.StartHUD)
	
