extends Node2D

@onready var bird = preload("res://scenes/bird.tscn")
@onready var ridge = preload("res://scenes/ridge.tscn")

var cameraPos := Vector2i(576, 324)
#
var screenSize:Vector2
var obs_type:Array
var speed: float = 200
@onready var camera = $eyes


# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_window().size
	obs_type = [bird, ridge]
	#$ui.get_node("start").pressed.connect(newGame())

func _process(_delta: float) -> void:
	if GameManager.gameRunning:
		camera.position.x += speed * _delta
		#ground pos update
		if camera.position.x - $background/ground.position.x > screenSize.x * 1.5:
			$background/ground.position.x += screenSize.x

	else:
		if Input.is_action_just_pressed("start"):
			GameManager.gameRunning = true
			$HUD.get_node("k2Continue").visible = false


func _on_timer_timeout():
	if GameManager.gameRunning == true:
		var obstacle = obs_type[randi() % obs_type.size()]
		var obs = obstacle.instantiate()
		
		obs.position.x = $dino.position.x + screenSize.x
		get_node("container").add_child(obs)