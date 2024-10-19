extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var win_label = $"../WinLabel"

func _on_body_entered(body):
	print(body.name)
	win_label.text = str(body.name) + " wins!!!"
	# Defer the disabling of the collision shape and visibility change
	call_deferred("_disable_and_hide")

	# Wait for 2 seconds and then reload the scene
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()

# A function that will be called after the physics step is complete
func _disable_and_hide():
	collision_shape_2d.disabled = true
	visible = false
