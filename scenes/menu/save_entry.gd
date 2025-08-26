extends HBoxContainer
class_name SaveEntry

signal select_requested(info: SaveManager.SaveInfo)
signal delete_requested(info: SaveManager.SaveInfo)

var _info: SaveManager.SaveInfo

static func create(info: SaveManager.SaveInfo) -> SaveEntry:
	var scene := preload("res://scenes/menu/save_entry.tscn")
	var x := scene.instantiate() as SaveEntry
	x._info = info
	x._fill_fields()
	return x

func _fill_fields() -> void:
	$Select.text = tr(&"SAVE_SELECT_MENU_ENTRY_BTN_SELECT")
	$Delete.text = tr(&"SAVE_SELECT_MENU_ENTRY_BTN_DELETE")

	$Info/Title.text = _info.name
	$Info/CTime.text = tr(&"SAVE_SELECT_MENU_ENTRY_CTIME") + &": " + _info.ctime
	$Info/MTime.text = tr(&"SAVE_SELECT_MENU_ENTRY_MTIME") + &": " + _info.mtime


func _on_select_pressed() -> void:
	emit_signal(&"select_requested", _info)

func _on_delete_pressed() -> void:
	emit_signal(&"delete_requested", _info)
