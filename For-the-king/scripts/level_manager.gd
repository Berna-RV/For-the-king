extends Node

var score = 0
@onready var score_label = $"../ScoreLabel"
#@onready var animation_player = $"../AnimationPlayer"

func add_point():
	#animation_player.play("pickup")
	score += 1
	score_label.text = "You collected " + str(score) + " coins."