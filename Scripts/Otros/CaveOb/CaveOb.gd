extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var Velocity
var traje = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if Glovar.trajedeCO == false:
		Glovar.trajedeCO = true
		$AnimatedSprite.animation = "1"
		$CollisionShape2D.scale.y = 1
	else:
		Glovar.trajedeCO = false
		$AnimatedSprite.animation = "2"
		$CollisionShape2D.scale.y = 0.8
	
	position = Glovar.PathFollowPosition
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += -Velocity * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
