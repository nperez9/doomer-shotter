extends Node2D

# this will preload an scene to instaciate this
const laser_scene: PackedScene = preload("res://scenes/proyectiles/laser.tscn")
const grenade_scene: PackedScene = preload("res://scenes/proyectiles/greanade.tscn")

func _on_gate_player_entered_gate(body):
	print("passed by a custom signal")

func _on_player_laser_fire(position, direction):
	var laser = laser_scene.instantiate()
	$Projectiles.add_child(laser)
	laser.position = position
	laser.direction = direction
	laser.look_at(direction)
	print("Player hass been cool uf")


func _on_player_grenade_fire(position, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(grenade)
	grenade.position = position
	grenade.linear_velocity = direction * grenade.speed
