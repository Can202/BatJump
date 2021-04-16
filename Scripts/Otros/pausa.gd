extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var butpressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$paused.hide()
	$exit.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter") or butpressed == true:
		butpressed = false
		if get_tree().paused == true:
			$exit.hide()
			get_tree().paused = false
			$paused.hide()
		else:
			$exit.show()
			get_tree().paused = true
			$paused.show()
	


func _on_button_pressed():
	butpressed = true


func _on_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Escenas/Menus/Menú.tscn")
