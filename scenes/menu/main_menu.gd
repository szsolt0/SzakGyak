extends Node


func _ready() -> void:
	print("settings menu")


func _on_play_pressed() -> void:
	# get_tree().change_scene_to_file("...")
	print("start game")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/settings_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
