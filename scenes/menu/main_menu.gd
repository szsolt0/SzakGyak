# This script manages the Main Menu UI.

extends Node

func _load_translations() -> void:
	$VBoxContainer/Play.text = tr(&"BTN_PLAY")
	$VBoxContainer/Settings.text = tr(&"BTN_SETTINGS")
	$VBoxContainer/Quit.text = tr(&"BTN_QUIT")

func _ready() -> void:
	preload("res://assets/fonts/Tiny5-Regular.ttf")
	if not GameSettings.get_content_warn_ack():
		get_tree().change_scene_to_file("res://scenes/menu/warn_menu.tscn")
		print("Warning loaded and displayed")
		
	print("Warning will not load, cuz it was loaded at least once")
	_load_translations()
	
	BgMusic.play(&"background")

func _on_play_pressed() -> void:
	print("play pressed")
	get_tree().change_scene_to_file("res://scenes/menu/save_select_menu.tscn")


func _on_settings_pressed() -> void:
	print("settings pressed")
	var settings := preload("res://scenes/menu/settings_menu.tscn").instantiate()
	add_child(settings)


func _on_quit_pressed() -> void:
	print("quit pressed")
	get_tree().quit()
	print("quitting...")
