extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var disparo=false
var cd=false
var BurbujaTimer=false
var BurbujaColision=false
# Called when the node enters the scene tree for the first time.

func _ready():
	randomize()
	$BurbujaTimer.start()
# Add it as a child of this node.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and disparo==false:
		disparo=true
		$cd.start()
	if event is InputEventMouseButton and !event.is_pressed():
		disparo=false
		
	if disparo==true:
		$nave._click()

func _process(delta):
	if disparo==true and cd==true:
		var newBala1 = load("res://bala.tscn").instance()
		get_parent().add_child(newBala1)
		newBala1.position=get_global_mouse_position()+Vector2(26,-10)
		newBala1.scale=Vector2(0.4, 0.3)
		var newBala2 = load("res://bala.tscn").instance()
		get_parent().add_child(newBala2)
		newBala2.position=get_viewport().get_mouse_position()+Vector2(-25,-10)
		newBala2.scale=Vector2(0.4, 0.3)
		
		cd=false
	
	if BurbujaTimer==true:
		$SpawnPath/SpawnLocation.offset = randi()
		var Burbuja = load("res://Burbuja.tscn").instance()
		get_parent().add_child(Burbuja)
		var direction = $SpawnPath/SpawnLocation.rotation + PI / 2
		# Set the mob's position to a random location.
		Burbuja.position = $SpawnPath/SpawnLocation.position
		# Add some randomness to the direction.
		
		BurbujaTimer=false

func _on_Timer_timeout():
	cd=true


func _on_BurbujaTimer_timeout():
	BurbujaTimer=true

