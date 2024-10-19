extends Area2D

@onready var timer = $Timer

@onready var player_1 = $"/root/Game/HBoxContainer/SubViewportContainer/SubViewport/Level/Player1"
@onready var player_2 = $"/root/Game/HBoxContainer/SubViewportContainer/SubViewport/Level/Player2"

# Store the initial spawn positions of both players
var player_1_spawn_position = Vector2()
var player_2_spawn_position = Vector2()

var player_1_dead = false
var player_2_dead = false

func _ready():
	# Save the initial positions of the players when the scene is loaded
	player_1_spawn_position = player_1.position
	player_2_spawn_position = player_2.position

func _on_body_entered(body):
	print("You died!")
	#Engine.time_scale = 0.5
	
	# Defer collision disabling to avoid flushing queries issue
	if body == player_1:
		player_1_dead = true
	elif body == player_2:
		player_2_dead = true

	timer.start()

func _on_timer_timeout():
	
	# Reset the position of the killed player and re-enable their collision
	if player_1_dead:
		player_1.position = player_1_spawn_position

	if player_2_dead:
		player_2.position = player_2_spawn_position
