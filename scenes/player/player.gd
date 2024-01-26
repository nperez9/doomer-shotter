extends Node2D

@export var move_speed: int = 500
var laser_sprite: Sprite2D

func _ready():
	# Access by unique name id
	laser_sprite = %LaserSprite
	print_debug(laser_sprite)

func _process(delta):
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += direction * 500 * delta
	
	# laser shoting input
	if Input.is_action_pressed("primary_action"):
		print_debug('Primare shot')
	
	if Input.is_action_pressed("secondary_action"):
		print_debug("open fire motherfucker")
	follow_pointer()

func follow_pointer() -> void: 
	var mouse_pos = get_global_mouse_position()
	var dir_to_mouse = mouse_pos - position
	rotation = dir_to_mouse.angle()
