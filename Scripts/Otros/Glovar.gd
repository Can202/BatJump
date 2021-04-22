extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var PathFollowPosition = Vector2()
var Score = 0
var BestScore = 0
var perder = false
var trajedeCO = false
var movetouch = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("f"):
		OS.window_fullscreen = !OS.window_fullscreen
