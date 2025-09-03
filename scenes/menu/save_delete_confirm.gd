# This script controls the save delete confirm popup

extends Control
class_name SaveDeleteConfirm

@onready var _info: SaveManager.SaveInfo
@onready var BASE_TEXT := tr(&"SAVE_SELECT_MENU_DELETE_TEXT")

func _load_translations() -> void:
	$VBoxContainer/Title.text = tr(&"SAVE_SELECT_MENU_DELETE_TITLE")
	$VBoxContainer/HBoxContainer/Confirm.text = tr(&"SAVE_SELECT_MENU_DELETE_BTN_CONFIRM")
	$VBoxContainer/HBoxContainer/Cancel.text = tr(&"SAVE_SELECT_MENU_DELETE_BTN_CANCEL")

func _ready() -> void:
	_load_translations()
	$VBoxContainer/ConfirmText.text = BASE_TEXT + &": '" + _info.name + &"' (" + _info.file + &")?"

func setup(info: SaveManager.SaveInfo) -> void:
	_info = info


func _on_confirm_pressed() -> void:
	SaveManager.remove_save_file(_info.file)
	
	var parent := get_parent() as SaveSelectMenu
	
	parent.reload_requested.emit()
	parent.remove_child(self)


func _on_cancel_pressed() -> void:
	get_parent().remove_child(self)
