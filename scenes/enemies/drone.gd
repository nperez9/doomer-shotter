extends CharacterBody2D

@export var speed: int = 200

func _process(_delta):
	var direction: Vector2 = Vector2.RIGHT
	velocity = direction * speed
	move_and_slide()
