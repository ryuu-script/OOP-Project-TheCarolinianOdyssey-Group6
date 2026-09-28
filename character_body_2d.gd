extends CharacterBody2D

const SPEED = 300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var area2d: Area2D = $Area2D

func _physics_process(delta: float) -> void:
	# Direction inputs
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")

	# Update velocity
	velocity.y = direction_y * SPEED
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# --- Animation Logic ---
	if direction != 0 or direction_y != 0:
		animated_sprite.play("walk")
		# Flip sprite left/right based on horizontal movement
		if direction != 0:
			animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.play("idle")

	move_and_slide()

	# --- Area & Interaction Logic ---
	var bodies = area2d.get_overlapping_areas()
	for x in bodies:
		if x != self:
			if "timer" in x and x.timer != null:
				x.timer.start(1)
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				if x.has_method("change_scene"):
					x.change_scene()
