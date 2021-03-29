extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$paused.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		if get_tree().paused == true:
			get_tree().paused = false
			$paused.hide()
		else:
			get_tree().paused = true
			$paused.show()
	
