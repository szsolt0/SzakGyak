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


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
