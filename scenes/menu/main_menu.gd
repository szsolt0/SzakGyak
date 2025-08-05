extends Node

func _load_translations() -> void:
	$VBoxContainer/Play.text = tr(&"BTN_PLAY")
	$VBoxContainer/Settings.text = tr(&"BTN_SETTINGS")
	$VBoxContainer/Quit.text = tr(&"BTN_QUIT")

func _ready() -> void:
	_load_translations()

func _on_play_pressed() -> void:
	# get_tree().change_scene_to_file("...")
	print("start game")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/settings_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
