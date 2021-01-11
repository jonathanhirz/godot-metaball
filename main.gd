extends Node2D

var water_particle
var node
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		water_particle = load("res://water_particle.tscn")
		node = water_particle.instance()
		node.position = get_viewport().get_mouse_position()
		get_node("water_container").add_child(node)
		count = count + 1
		print(count)
	return
