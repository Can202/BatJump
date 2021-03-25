extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var accion = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.current_animation = "start"
	if Glovar.Score > Glovar.BestScore:
		Glovar.BestScore = Glovar.Score
	$score.text = str(Glovar.Score)
	$bestscore.text = str(Glovar.BestScore)
	
	var data = $Guardar/g.get_data()
	data["BestScore"] = Glovar.BestScore
	$Guardar/g.save_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene("res://Escenas/Juego/Juego.tscn")

func _on_Restart_pressed():
	$sfx/one.play()
	$AnimationPlayer.current_animation = "end"
	accion = 2


func _on_Menu_pressed():
	$sfx/one.play()
	$AnimationPlayer.current_animation = "end"
	accion = 1


func _on_AnimationPlayer_animation_finished(anim_name):
	if accion == 1:
		get_tree().change_scene("res://Escenas/Menus/Menú.tscn")
	elif accion == 2:
		get_tree().change_scene("res://Escenas/Juego/Juego.tscn")
	else:
		return
