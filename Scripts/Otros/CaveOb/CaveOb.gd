extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var Velocity
var traje = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Glovar.PathFollowPosition
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += -Velocity * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
