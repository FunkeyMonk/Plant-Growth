extends Control

@onready var coinLabel = $"Coin Counter"

func _process(delta):
	if Global.coin_count <= 0:
		$"Buy Seeds".disabled = true
		$"Buy Soil".disabled = true
		$"Buy Pots".disabled = true
	
	coinLabel.text = "Coins: %d" % Global.coin_count

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_buy_seeds_pressed():
	Global.seed_count += 1
	Global.coin_count -= Global.seed_price
	print("Seeds added")


func _on_buy_pots_pressed():
	Global.pot_count += 1
	Global.coin_count -= Global.pot_price
	print("Pots added")


func _on_buy_soil_pressed():
	Global.soil_count += 1
	Global.coin_count -= Global.soil_price
	print("Soil added")
