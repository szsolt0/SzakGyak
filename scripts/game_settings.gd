extends Node

const SETTINGS_PATH = "user://settings.ini"

var config = ConfigFile.new()

func _ready() -> void:
	if FileAccess.file_exists(SETTINGS_PATH):
		config.load(SETTINGS_PATH)
	else:
		config.set_value("volume", "master", 40)
		config.set_value("volume", "sfx", 100)
		config.set_value("volume", "music", 100)
		config.set_value("volume", "ui", 100)

		config.set_value("video", "quality", "medium")
		config.set_value("video", "animations", true)
		config.set_value("video", "font", "pixel")
		
		config.set_value("main", "lang", "ask")
		# WARNING: DO NOT MODIFY.
		config.set_value("main", "content-warn-ack", false)

func set_volume(key: String, val: int) -> void:
	config.set_value("volume", key, clampi(val, 0, 100))
	config.save(SETTINGS_PATH)

func set_video(key: String, val: Variant) -> void:
	config.set_value("video", key, val)
	config.save(SETTINGS_PATH)

func set_main(key: String, val: Variant) -> void:
	config.set_value("main", key, val)
	config.save(SETTINGS_PATH)

func load_volume() -> Dictionary:
	var values = {}
	for key in config.get_section_keys("volume"):
		values[key] = config.get_value("volume", key)
	
	return values

func load_video() -> Dictionary:
	var values = {}
	for key in config.get_section_keys("video"):
		values[key] = config.get_value("video", key)
	
	return values

func load_main() -> Dictionary:
	var values = {}
	for key in config.get_section_keys("main"):
		values[key] = config.get_value("main", key)
	
	return values
