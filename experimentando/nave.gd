extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var booleano=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if booleano==false:
		position=Vector2(240, 426.008)
	else:
		position=get_viewport().get_mouse_position()
	
func _click():
	booleano=true
