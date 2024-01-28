extends CharacterBody2D

func func _process(_delta):
    var direction: Vector2 = Vector2.RIGHT
    velocity = direction * speed
    move_and_slide()