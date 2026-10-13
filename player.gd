extends CharacterBody2D

const SPEED := 400.0
const JUMP_VELOCITY := -400.0
const GRAVITY := 980.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * SPEED
	move_and_slide()
	if global_position.y > 800:
		global_position = Vector2(100, 100)
		velocity = Vector2.ZERO
