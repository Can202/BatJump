extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var anim = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var data = $Guardar/g.get_data()
	if data.empty():
		pass
	else:
		Glovar.BestScore = data["BestScore"]
	
	$Animation.current_animation = "start"
	$PSTPA.current_animation = "anim"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if OS.window_fullscreen == true:
		$fs/sprite.animation = "min"
	else:
		$fs/sprite.animation = "full"
	
	if Input.is_action_just_pressed("space"):
		anim = 1
		$Animation.current_animation = "end"
		$sfx/one.play()


func _on_Exit_pressed():
	get_tree().quit()


func _on_TouchScreenButton_pressed():
	anim = 1
	$Animation.current_animation = "end"
	$sfx/one.play()
	


func _on_Animation_animation_finished(anim_name):
	if anim == 1:
		get_tree().change_scene("res://Escenas/Juego/Juego.tscn")
	anim = 0


func _on_TouchScreenButton2_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
