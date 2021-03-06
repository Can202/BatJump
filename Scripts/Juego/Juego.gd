extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var cavethings
var anim = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$timetospawn.wait_time = 2
	$Animation/Sprite.show()
	$Animation.current_animation = "start"
	$music.play()
	Glovar.Score = 0
	$timetospawn.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Glovar.Score >= 10 and Glovar.Score <= 24:
		$timetospawn.wait_time = 1.8
	elif Glovar.Score >= 25 and Glovar.Score <= 49:
		$timetospawn.wait_time = 1.5
	elif Glovar.Score >= 50:
		$timetospawn.wait_time = 1.3
	if Input.is_action_just_pressed("scape"):
		get_tree().change_scene("res://Escenas/Menus/Menú.tscn")
	$Score.text = str(Glovar.Score)
	$parallax/layer/back.position.x -= 20 * delta
	if $parallax/layer/back.position.x <= -480:
		$parallax/layer/back.position.x = 0
	if Glovar.perder == true:
		$Animation.current_animation = "end"
		anim = 1
		Glovar.perder = false


func _on_timetospawn_timeout():
	$path/follow.set_offset(randi())
	Glovar.PathFollowPosition = $path/follow.position
	var cavet = cavethings.instance() # funciona si exportas el no se que que esta arriba
	$cavething.add_child(cavet) # añade el hijo A (aro)
	
	$timetospawn.start()




func _on_Animation_animation_finished(anim_name):
	if anim == 1:
		get_tree().change_scene("res://Escenas/Otros/Fin/Fin.tscn")
		anim = 0


func _on_up_pressed():
	Glovar.movetouch = 1


func _on_down_pressed():
	Glovar.movetouch = -1

