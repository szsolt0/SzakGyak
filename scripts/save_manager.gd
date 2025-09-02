# This file is responsible for managing saving and loading

extends Node

class SaveInfo:
	var file: String
	var name: String
	var ctime: String
	var mtime: String

const SAVE_DIR := &"user://saves"

# without the ".save" at the end.
@onready var _save_file_name: String = ""
@onready var _save_data: Dictionary = {}

func get_list_of_save_files() -> Array[SaveInfo]:
	if not DirAccess.dir_exists_absolute(SAVE_DIR):
		DirAccess.make_dir_recursive_absolute(SAVE_DIR)

	var save_dir := DirAccess.open(SAVE_DIR)
	var saves: Array[SaveInfo] = []
	
	save_dir.list_dir_begin()
	var file_name := save_dir.get_next()
	while file_name != "":
		if save_dir.current_is_dir() or not file_name.ends_with(".save"):
			# we don't care about subdirectories or files other than *.save
			file_name = save_dir.get_next()
			continue
		
		var save_info := SaveInfo.new()
		_load(file_name.left(-5))
		
		save_info.file  = file_name.left(-5) # remove the ".save" from the end
		save_info.name  = _save_data["__meta"]["name"]
		save_info.ctime = _save_data["__meta"]["ctime"]
		save_info.mtime = _save_data["__meta"]["mtime"]
		
		saves.append(save_info)
		_save_data = {}
		
		file_name = save_dir.get_next()
	
	return saves

func save_state(
	ns: StringName, state: Dictionary[StringName, Variant]
) -> Error:
	var today := Time.get_datetime_string_from_system(false, true)

	_save_data[ns] = state
	_save_data["__meta"]["mtime"] = today

	return _commit()

func load_state(ns: StringName) -> Dictionary[StringName, Variant]:
	return _save_data[ns]

func load_save_file(file: String) -> Error:
	_save_file_name = file
	return _load(file)

func create_save_file(file: String, name: String) -> Error:
	var today := Time.get_datetime_string_from_system(false, true)
	_save_file_name = file

	_save_data = {}
	_save_data["__meta"] = {
		"name": name,
		"ctime": today,
		"mtime": today,
	}

	_save_file_name = ""
	return _commit()

func remove_save_file(file: String) -> void:
	DirAccess.remove_absolute(SAVE_DIR + "/" + file + ".save")



func _commit() -> Error:
	if not DirAccess.dir_exists_absolute(SAVE_DIR):
		DirAccess.make_dir_recursive_absolute(SAVE_DIR)

	var save_path := SAVE_DIR + "/" + _save_file_name + ".save"
	var tmp_save_path := save_path + ".tmp"

	var save_data := JSON.stringify(_save_data).to_utf8_buffer()

	var tmp_save := FileAccess.open(tmp_save_path, FileAccess.WRITE)
	
	if null == tmp_save:
		return ERR_CANT_CREATE
	
	if not tmp_save.store_buffer(save_data):
		return ERR_FILE_CANT_WRITE
	
	var rename_err := DirAccess.rename_absolute(tmp_save_path, save_path)
	
	if rename_err != OK:
		DirAccess.remove_absolute(tmp_save_path)
		return rename_err
	
	return OK

func _load(file: String) -> Error:
	var save_data_raw := FileAccess.open(
		SAVE_DIR + "/" + file + ".save", FileAccess.READ
	)
	
	if save_data_raw == null:
		return ERR_FILE_NOT_FOUND
	
	var save_data = JSON.parse_string(save_data_raw.get_as_text())
	
	_save_data = save_data
	
	return OK
