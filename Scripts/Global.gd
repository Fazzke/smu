extends Node

# nodes set automaticaly
#var GameState
#var Player
#var GUI
#var Jump_SFX
#var Pain_SFX



#The currently active scene, at the beginning its null but it will change
var currentScene = null

var loader
var wait_frames
var time_max = 100 # msec

# some data for our game.  It could be HPs, Alignment, Direction, etc...
var GameState
var Player
var GUI
var Jump_SFX
var Pain_SFX


func _ready():
   #On load set the current scene to the last scene available, IT WILL BE THE MAIN SCENE!!!
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
   #Demonstrate setting a global variable with the value of int 9000
#   Global.set("MAX_POWER_LEVEL",9000)
   
# create a function to switch between scenes 
func setScene(path):
	# game requests to switch to this scene
	loader = ResourceLoader.load_interactive(path)
	set_process(true)
   #clean up the current scene
	currentScene.queue_free()
   #load the file passed in as the param "path"
	#var scene = ResourceLoader.load(path)
   #create an instance of our scene
	#currentScene = scene.instance()
	# start your "loading..." animation
	get_node("animation").play("loading")
	wait_frames = 1
   # add scene to root   THATS THE CLUEEE!!!!
	#get_tree().get_root().add_child(currentScene)







# BACKUP (:

#func _ready():
#	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
#
#func setScene(path):
#	currentScene.queue_free()
#	var scene = ResourceLoader.load(path)
#	currentScene = scene.instance()
#	get_tree().get_root().add_child(currentScene)
  

