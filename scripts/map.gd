extends Node2D

@onready var bird = preload("res://scenes/bird.tscn")
@onready var ridge = preload("res://scenes/ridge.tscn")

var cameraPos := Vector2i(576, 324)
var score:int
const scoreMod : int = 10
var startSpeed : float = 10
var speed : float
const maxSpeed : int = 25
var screenSize
var gameRunning:bool = false
var obs_type:Array

var highScore: int

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_window().size
	newGame()
	obs_type = [bird, ridge]
	#$ui.get_node("start").pressed.connect(newGame())
func newGame():
	score = 0
	updateScore()
	$eyes.position = cameraPos
	$background/ground.position = Vector2i(0,0)
	$HUD.get_node("k2Continue").show()
	$ui.hide()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.gameRunning == true:
		
		speed = startSpeed
		$eyes.position.x += speed
		score += speed/scoreMod
		updateScore()
		#ground pos update
		if $eyes.position.x - $background/ground.position.x > screenSize.x * 1.5:
			$background/ground.position.x += screenSize.x
	else:
		if Input.is_action_pressed("start") :
			GameManager.gameRunning = true
			$HUD.get_node("k2Continue").visible = false
	
func updateScore():
	$HUD.get_node("scoreLabel").text = "SCORE: " + str(score)
	
		
func updateHighScore():
	if score > highScore:
		highScore = score
	$HUD.get_node("highScore").text = "HIGH SCORE: "+ str(highScore)
	print(highScore)

func _on_timer_timeout():
	if GameManager.gameRunning == true:
		var obstacle = obs_type[randi() % obs_type.size()]
		var obs = obstacle.instantiate()
		
		obs.position.x = $dino.position.x + screenSize.x
		get_node("container").add_child(obs)
	

