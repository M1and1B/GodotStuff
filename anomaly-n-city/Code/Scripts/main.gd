extends Node

var player_scene = preload("res://Code/Scenes/player.tscn")

func _ready() -> void:
	var player = player_scene.instantiate()
	add_child(player)
