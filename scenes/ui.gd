extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false

func _on_start_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/map.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_map_new_high_score(highScore):
	$highScoreLabel.text = "HIGH SCORE: "+ str(highScore)
