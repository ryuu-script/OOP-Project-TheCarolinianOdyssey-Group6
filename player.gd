class_name Player
extends Node2D

@onready var character = $CharacterBody2D

var health = 10
var strength = 5
var attack = 5
var skillPoints = 0

var hp = health * 5
var critDmg = strength * 3
var critRate = randi_range(1, 100)
var charisma = randi_range(1, 100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var current_scene_path = get_tree().current_scene.get_path()
	print(current_scene_path)
	print(get_tree().current_scene.scene_file_path)
	if String(current_scene_path) == "/root/CanvasLayer":
		print("Player is in the battle scene.")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
