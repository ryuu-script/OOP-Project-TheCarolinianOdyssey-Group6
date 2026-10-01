extends Area2D

@export var building_name: String = "Building Name"
@export var scene_name: String = "res://new.tscn"

@onready var label = $Label
@onready var timer = $Timer

func change_scene():
	get_tree().change_scene_to_file(scene_name)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if timer.time_left:
		label.text = str(building_name) if building_name != null else ""
	else:
		label.text = ""
