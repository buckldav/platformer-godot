extends Node2D

const COIN = 50
onready var HUD = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Coin_body_entered(body):
	HUD.score += COIN
	HUD.ScoreLabel.set_text(str(HUD.score))
	get_node("Collectibles").remove_child(get_node("Collectibles/Coin"))
