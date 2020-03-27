extends Control

# Variables
export var score = 2000
var interval = 0
# Constants
const TIME_STEP = 1
const SCORE_STEP = 10
const COIN = 50
# Nodes
onready var ScoreLabel = get_node("Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreLabel.set_text(str(score))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interval += delta
	if interval >= TIME_STEP:
		score -= SCORE_STEP
		ScoreLabel.set_text(str(score))
		interval = 0