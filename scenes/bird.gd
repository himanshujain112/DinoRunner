extends Area2D
var speed:float = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = randi_range(380, 485)
	print("bird spawned")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= speed * delta
		


func _on_body_entered(body):
	if body.is_in_group("Player"):
		gameOver()

func gameOver():
	get_tree().paused = true
	get_node("/root/map/ui").show()
	get_node("/root/map").updateHighScore()

func _on_timer_timeout():
	print("destoryed")
	queue_free()
