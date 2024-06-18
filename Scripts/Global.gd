extends Node2D

@onready var pot_button = "res://Scenes/Pot.tscn"

func _process(delta):
	if coin_count <= 0:
		coin_count = 0

#Shop Values
var seed_count = 0
var soil_count = 0
var pot_count = 0

#prices
var seed_price = 5
var soil_price = 5
var pot_price = 10

#water
var water_val = 0

#coin
var coin_count = 100

#Pots
var needsP = true
var needsSo = false
var needsSe = false
var needsW = false
var growing = false

#-----------------Functions
"""
func pot_press():
	if (Global.needsP) and (Global.pot_count != 0):
		Global.pot_count -= 1
		Global.needsP = false
		Global.needsSo = true
		print("Pot")
		pot_button.text = "Pot"
	elif (Global.needsSo) and (Global.soil_count != 0):
		Global.soil_count -= 1
		Global.needsSo = false
		Global.needsSe = true
		print("Soiled Pot")
		pot_button.text = "Soiled Pot"
	elif (Global.needsSe) and (Global.seed_count != 0):
		Global.seed_count -= 1
		Global.needsSe = false
		Global.needsW = true
		print("Seeded Pot")
		pot_button.text = "Seeded Pot"
	elif (Global.needsW) and (Global.water_val != 0):
		Global.water_val -= 1
		Global.needsW = false
		Global.growing = true
		print("Watered Pot")
		pot_button.text = "Watered Pot"
"""
