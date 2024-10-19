extends Area2D

@onready var level_manager = %LevelManager
@onready var animation_player = $AnimationPlayer
@onready var pickup_sound = $PickupSound

func _on_body_entered(body):
	level_manager.add_point()
	pickup_sound.play()
	animation_player.play("pickup")
