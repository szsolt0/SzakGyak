# This script manages the Save Select UI.

extends Control

@onready var TITLE := $MarginContainer/VBoxContainer/Title
@onready var NEW_SAVE_BTN := $MarginContainer/VBoxContainer/NewSave
@onready var BACK_BTN := $MarginContainer/VBoxContainer/Back

@onready var SAVE_LIST := $MarginContainer/VBoxContainer/ScrollContainer/SaveList

func _load_translations() -> void:
	TITLE.text = tr(&"LVL_SELECT_MENU_TITLE")
	NEW_SAVE_BTN.text = tr(&"LVL_SELECT_MENU_NEW_SAVE")
	BACK_BTN.text = tr(&"BTN_BACK")

func _ready() -> void:
	_load_translations()
	
	for save in SaveManager.get_list_of_save_files():
		print(save.name)
		var entry := SaveEntry.create(save)
		
		entry.select_requested.connect(_on_save_select_requested)
		entry.connect(&"delete_requested", _on_save_delete_requested)
		
		SAVE_LIST.add_child(entry)

func _on_save_select_requested(info: SaveManager.SaveInfo) -> void:
	print("selected save: ", info.name)
	SaveManager.load_save_file(info.file) # TODO: handle errors
	# this is where the game.gd supposed to take control
	get_tree().change_scene_to_file("res://scenes/game/Game.tscn")

func _on_save_delete_requested(info: SaveManager.SaveInfo) -> void:
	print("delete save: ", info.name)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
