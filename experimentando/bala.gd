extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var recall=false
# Called when the node enters the scene tree for the first time.
func _ready():
	$recall.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	position+=Vector2(0, -500)*delta

func _on_bala_area_entered(area):
	if recall==true and !area.get_name().begins_with("nave"):
		queue_free()


func _on_recall_timeout():
	recall=true
