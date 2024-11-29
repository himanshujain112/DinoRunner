extends Area2D

var speed:float = 200
var timeToDestroy = 6
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y = 536 
	print("ridge spawned")


func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("attackedd")

func _process(_delta: float) -> void:
	await get_tree().create_timer(timeToDestroy).timeout
	print("destroyed") 
	self.queue_free()
