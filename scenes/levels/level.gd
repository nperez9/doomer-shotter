extends Node2D

# this will preload an scene to instaciate this
const laser_scene: PackedScene = preload("res://scenes/proyectiles/laser.tscn")

func _on_gate_player_entered_gate(body):
	print("passed by a custom signal")


func _on_player_laser_fire():
	var laser = laser_scene.instantiate()
	add_child(laser)
	laser.position = $Player.position
	print("Player hass been cool uf")
