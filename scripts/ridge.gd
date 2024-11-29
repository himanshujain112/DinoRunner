extends Area2D

var speed:float = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y = 536 
	print("ridge spawned")


func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("attackedd")
