extends Node

var score: int
var highScore: int

var gameRunning: bool = false


func _onGameOver() -> void:
    get_tree().paused = true
    get_tree().get_node("ui").visible = true

func _onNewGame():
    get_tree().paused = false
    score = 0