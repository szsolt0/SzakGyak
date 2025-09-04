# This script manages the "new save" popup

extends Control
class_name NewSaveMenu

@onready var save_name: LineEdit = $VBoxContainer/SaveName
@onready var save_file: LineEdit = $VBoxContainer/SaveFile
@onready var error_msg: Label = $VBoxContainer/ErrorMsg

@onready var save_file_regex := RegEx.new()

func _load_translations() -> void:
	$VBoxContainer/Title.text = tr(&"SAVE_SELECT_MENU_NEW_SAVE")
	$VBoxContainer/SaveNameLabel.text = tr(&"SAVE_SELECT_MENU_SAVE_NAME")
	$VBoxContainer/SaveFileLabel.text = tr(&"SAVE_SELECT_MENU_SAVE_FILE")
	$VBoxContainer/Create.text = tr(&"SAVE_SELECT_MENU_BTN_CREATE")
	$VBoxContainer/Back.text = tr(&"GENERIC_BTN_BACK")

func _ready() -> void:
	_load_translations()
	
	# allows letters, numbers, underscore, and dash
	save_file_regex.compile("^[\\p{L}\\p{N}_-]+$")

func set_error(err: StringName) -> void:
	if err.is_empty():
		error_msg.hide()
	else:
		error_msg.text = tr(err)
		error_msg.show()

func _on_create_pressed() -> void:
	var name := save_name.text.strip_edges()
	var file := save_file.text.strip_edges()
	
	print("creating save file '%s' with name '%s'" % [name, file])
	
	if name.is_empty():
		set_error(&"SAVE_SELECT_MENU_ERR_EMPTYNAME")
		return
	
	if file.is_empty():
		set_error(&"SAVE_SELECT_MENU_ERR_EMPTYFILENAME")
		return
	
	if not is_valid_file_name(file):
		set_error(&"SAVE_SELECT_MENU_ERR_BADFILENAME")
		return
	
	if SaveManager.save_exists(file):
		set_error(&"SAVE_SELECT_MENU_ERR_EXISTS")
		return
	
	SaveManager.create_save_file(file, name)
	
	var parent := get_parent() as SaveSelectMenu
	
	parent.reload_requested.emit()
	parent.remove_child(self)

func clean_text(text: String) -> String:
	return text.strip_edges().to_lower().replace(" ", "_")

func is_valid_file_name(text: String) -> bool:
	return save_file_regex.search(text) != null

func _on_save_name_text_changed(new_text: String) -> void:
	save_file.text = clean_text(new_text)
	save_file.text_changed.emit(clean_text(new_text))


func _on_save_file_text_changed(new_text: String) -> void:
	#print(new_text, &": ", is_valid_file_name(new_text))
	pass


func _on_back_pressed() -> void:
	get_parent().remove_child(self)
