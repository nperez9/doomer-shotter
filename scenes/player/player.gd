extends CharacterBody2D

@export var move_speed: int = 500
var laser_sprite: Sprite2D
var can_shoot = true
var can_granade = true

signal laser_fire(position: Vector2, direction: Vector2)
signal grenade_fire(position: Vector2, direction: Vector2)

func _ready():
	# Access by unique name id
	laser_sprite = %LaserSprite

func _process(_delta):
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# No need for delta on move and slide
	velocity = direction * move_speed
	move_and_slide()

	# laser shoting input
	if Input.is_action_just_pressed("primary_action") && can_shoot:
		can_shoot = false
		var laser_marker = get_random_firepoint()
		$LaserTimer.start()
		print('Primare shot')
		laser_fire.emit(laser_marker.global_position, get_player_look_direction())
	
	if Input.is_action_pressed("secondary_action") && can_granade:
		$GranadeTimer.start()
		can_granade = false
		grenade_fire.emit($GrenadeFirePoint.global_position, get_player_look_direction())
		print("open fire motherfucker")
	
	look_at(get_global_mouse_position())
	## follow_pointer()

func get_player_look_direction() -> Vector2:
	var dir = (get_global_mouse_position() - position).normalized()
	return dir

func follow_pointer() -> void: 
	var mouse_pos = get_global_mouse_position()
	var dir_to_mouse = mouse_pos - position
	rotation = dir_to_mouse.angle()

func get_random_firepoint() -> Marker2D:
	var markers = $FirePoints.get_children()
	return markers[randi() % markers.size()]

func _on_laser_timer_timeout():
	can_shoot = true
	
func _on_granade_timer_timeout():
	can_granade = true
