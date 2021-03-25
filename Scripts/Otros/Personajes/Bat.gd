extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move = Vector2()
export (int) var jump_force
var down = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if down == true:
		$AnimatedSprite.flip_v = false
		move.y += 150 * delta
	else:
		$AnimatedSprite.flip_v = true
		move.y += -150 * delta
	if Input.is_action_just_pressed("ui_up"):
		$music/one.play()
		down = true
		move.y = -jump_force
	if Input.is_action_just_pressed("ui_down"):
		$music/one.play()
		down = false
		move.y = jump_force
	
	move_and_slide(move)


func _on_Area2D_area_entered(area):
	if area.is_in_group("cavethings"):
		$music/two.play()
		$Animation.current_animation = "end"
		Glovar.perder = true
	if area.is_in_group("punto"):
		Glovar.Score += 1


func _on_Area2D_body_entered(body):
	pass
