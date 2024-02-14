extends CharacterBody2D

@export var move_speed: int = 500
var laser_sprite: Sprite2D
var can_shoot = true
var can_granade = true

signal laser_fire

func _ready():
	# Access by unique name id
	laser_sprite = %LaserSprite
	print_debug(laser_sprite)

func _process(_delta):
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# No need for delta on move and slide
	velocity = direction * move_speed
	move_and_slide()

	# laser shoting input
	if Input.is_action_just_pressed("primary_action") && can_shoot:
		## selects a random firepoint
		can_shoot = false
		$LaserTimer.start()
		print('Primare shot')
		laser_fire.emit()
	
	if Input.is_action_pressed("secondary_action") && can_granade:
		$GranadeTimer.start()
		can_granade = false		
		print("open fire motherfucker")
	
	follow_pointer()

func follow_pointer() -> void: 
	var mouse_pos = get_global_mouse_position()
	var dir_to_mouse = mouse_pos - position
	rotation = dir_to_mouse.angle()


func _on_laser_timer_timeout():
	can_shoot = true
	
func _on_granade_timer_timeout():
	can_granade = true
