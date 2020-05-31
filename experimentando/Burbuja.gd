extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal hit
var aleatorio
# Called when the node enters the scene tree for the first time.
func _ready():
	aleatorio=randi()%1+1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if aleatorio==1:
		position+=Vector2(0, 100)*delta
	
	if position.x>600 or position.y>600 or position.x<-100 or position.y<-100:
		queue_free()

func _on_Burbuja_area_shape_entered(area_id, area, area_shape, self_shape):
	#print(area.get_name())
	#for i in get_overlapping_areas():
		#print(i.get_name())
	if area.get_name().begins_with("@bala") or area.get_name().begins_with("bala"):
		queue_free()
	print(area.get_name())
