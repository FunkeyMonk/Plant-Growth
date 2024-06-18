extends Node2D

var water_full = false
@onready var coinLabel = $"Game Screen/Coin Counter"


@onready var node_to_save = $Node2D
var scene = PackedScene.new()



func _process(delta):
	if Global.water_val == 3:
		$"Game Screen/Water".text = "FULL"
		$"Game Screen/Water".disabled = true
	elif Global.water_val == 2:
		$"Game Screen/Water".text = "Water 2/3"
	elif Global.water_val == 1:
		$"Game Screen/Water".text = "Water 1/3"
	else: 
		$"Game Screen/Water".text = "Water"
		$"Game Screen/Water".disabled = false
	
	if (Global.needsP):
		$"Game Screen/Pot".text = "Need Pot"
	elif (Global.needsSo) and (Global.needsP == false):
		$"Game Screen/Pot".text = "Potted"
	elif (Global.needsSe) and (Global.needsSo == false):
		$"Game Screen/Pot".text = "Soiled Pot"
	elif (Global.needsW) and (Global.needsSe == false):
		$"Game Screen/Pot".text = "Seeded Pot"
	else: 
		$"Game Screen/Pot".text = "Watered Pot"
	coinLabel.text = "Coins: %d" % Global.coin_count
	
	if Global.growing:
		$Corn.visible = true
		if $Corn.position.y >= -100:
			var TimeInSeconds = 5;
			if TimeInSeconds > 0:
				TimeInSeconds -= delta
				$Corn.position.y -= 10 * delta
		else:
			$"Win Text".visible = true

# Water
func _on_button_pressed():
	Global.water_val += 1
	print(Global.water_val)


# Pot
func _on_pot_pressed():
	if (Global.needsP) and (Global.pot_count != 0):
		Global.pot_count -= 1
		Global.needsP = false
		Global.needsSo = true
		$Pot_image.visible = true
		print("Pot")
	elif (Global.needsSo) and (Global.soil_count != 0):
		Global.soil_count -= 1
		Global.needsSo = false
		Global.needsSe = true
		$Pot_image.visible = false
		$PotWithSoil_image.visible = true
		print("Soiled Pot")
	elif (Global.needsSe) and (Global.seed_count != 0):
		Global.seed_count -= 1
		Global.needsSe = false
		Global.needsW = true
		$Seeds_image.visible = true
		print("Seeded Pot")
	elif (Global.needsW) and (Global.water_val != 0):
		Global.water_val -= 1
		Global.needsW = false
		Global.growing = true
		$Seeds_image.visible = false
		$WateringCan_image.visible = true
		print("Watered Pot")

#--------------- Bottom Bar ---------------
func _on_options_pressed():
	scene.pack(node_to_save)
	ResourceSaver.save(scene, "res://game.tscn")
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
func _on_inventory_pressed():
	pass
func _on_shop_pressed():
	scene.pack(node_to_save)
	ResourceSaver.save(scene, "res://game.tscn")
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")

