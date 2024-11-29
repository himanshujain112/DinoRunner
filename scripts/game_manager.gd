extends Node

var score: int
var highScore: int

var gameRunning: bool = false

var startSpeed = 200.00
var hardSpeed = 500.00

var spawnCount: int = 0
var hardMode = false

func _onGameOver() -> void:
    get_tree().paused = true
    get_tree().get_node("ui").visible = true

func _onNewGame():
    get_tree().paused = false
    score = 0