extends Node2D

@onready var score_label: Label = $CanvasLayer/ScoreLabel

func _process(_delta):
	score_label.text = "Score: " + str(Global.score)
