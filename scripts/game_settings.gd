extends Node

const SETTINGS_PATH := "user://settings.ini"
const PIXEL_FONT_PATH := "res://assets/fonts/pixel_font.tres"

# volume
var _master_volume: int = 40
var _sfx_volume: int = 100
var _music_volume: int = 100
var _ui_volume: int = 100


# video
enum VideoQuality {LOW, MEDIUM, HIGH}
var _video_quality: VideoQuality = VideoQuality.MEDIUM
var _video_animations: bool = true
enum FontStyle {PIXEL, READABLE}
var _video_font: FontStyle = FontStyle.PIXEL

# main
var _main_lang: String = "ask" # TODO: implement this
# WARNING: DO NOT MODIFY.
var _content_warn_ack: bool = false

func _load_from_file() -> void:
	var config := ConfigFile.new()
	var err := config.load(SETTINGS_PATH)
	
	if err != OK:
		return
	
	# --- volume ---

	_master_volume = clampi(config.get_value("volume", "master", 40), 0, 100)
	_sfx_volume = clampi(config.get_value("volume", "sfx", 100), 0, 100)
	_music_volume = clampi(config.get_value("volume", "music", 100), 0, 100)
	_ui_volume = clampi(config.get_value("volume", "ui", 100), 0, 100)

	# --- video ---

	var quality_str := str(config.get_value("video", "quality", "medium"))
	match quality_str:
		"low":
			_video_quality = VideoQuality.LOW
		"medium":
			_video_quality = VideoQuality.MEDIUM
		"high":
			_video_quality = VideoQuality.HIGH
		_:
			push_error("invalid video quality: '%s'" % quality_str)
			_video_quality = VideoQuality.MEDIUM
	
	_video_animations = bool(config.get_value("video", "animations", true))

	var font_str := str(config.get_value("video", "font", "pixel")).to_lower()
	match font_str:
		"pixel":
			_video_font = FontStyle.PIXEL
		"readable":
			_video_font = FontStyle.READABLE
		_:
			push_error("invalid video font: '%s'" % font_str)
			_video_font = FontStyle.PIXEL

	# Main
	_main_lang = str(config.get_value("main", "lang", "ask"))
	_content_warn_ack = bool(config.get_value("main", "content-warn-ack", false))

func _apply_all() -> void:
	set_master_volume(get_master_volume())
	set_sfx_volume(get_sfx_volume())
	set_ui_volume(get_ui_volume())
	set_music_volume(get_music_volume())
	
	set_video_quality(get_video_quality())
	set_video_font(get_video_font())
	set_video_animations(get_video_animations())

func reload() -> void:
	_load_from_file()
	_apply_all()

func _ready() -> void:
	reload()

func commit() -> void:
	var config := ConfigFile.new()
	
	# --- volume ---
	config.set_value("volume", "master", _master_volume)
	config.set_value("volume", "sfx", _sfx_volume)
	config.set_value("volume", "music", _music_volume)
	config.set_value("volume", "ui", _ui_volume)
	
	# --- video ---
	var quality_str: String
	match _video_quality:
		VideoQuality.LOW:
			quality_str = "low"
		VideoQuality.MEDIUM:
			quality_str = "medium"
		VideoQuality.HIGH:
			quality_str = "high"
	
	config.set_value("video", "quality", quality_str)
	config.set_value("video", "animations", _video_animations)

	var font_str: String
	match _video_font:
		FontStyle.PIXEL:
			font_str = "pixel"
		FontStyle.READABLE:
			font_str = "readable"

	config.set_value("video", "font", font_str)

	# --- main ---
	config.set_value("main", "lang", _main_lang)
	config.set_value("main", "content-warn-ack", _content_warn_ack)

	var err := config.save(SETTINGS_PATH)
	if err != OK:
		push_error("failed to save settings to '%s'" % SETTINGS_PATH)


# --- volume ---

func set_master_volume(val: int) -> void:
	_master_volume = clampi(val, 0, 100)

func get_master_volume() -> int:
	return _master_volume


func set_sfx_volume(val: int) -> void:
	_sfx_volume = clampi(val, 0, 100)

func get_sfx_volume() -> int:
	return _sfx_volume


func set_music_volume(val: int) -> void:
	_music_volume = clampi(val, 0, 100)

func get_music_volume() -> int:
	return _music_volume


func set_ui_volume(val: int) -> void:
	_ui_volume = clampi(val, 0, 100)

func get_ui_volume() -> int:
	return _ui_volume


# --- video ---

const FONT_OVERRIDE := [
	"Label",
	"Button",
	"LineEdit",
	"TextEdit",
	"CheckBox",
	"OptionButton",
	"RichTextLabel"
]

func _set_font(path: String) -> void:
	var font := FontFile.new()
	font.load_dynamic_font("res://assets/fonts/Tiny5-Regular.ttf")

	var theme := ThemeDB.get_default_theme()
	
	for item in FONT_OVERRIDE:
		theme.set_font("font", item, font)

func _clear_font() -> void:
	var theme := ThemeDB.get_default_theme()
	
	for item in FONT_OVERRIDE:
		theme.clear_font("font", item)

func set_video_quality(val: VideoQuality) -> void:
	if val in VideoQuality.values():
		_video_quality = val
	else:
		push_error("invalid video quality: '%s'" % val)

func get_video_quality() -> VideoQuality:
	return _video_quality


func set_video_animations(val: bool) -> void:
	_video_animations = val

func get_video_animations() -> bool:
	return _video_animations


func set_video_font(val: FontStyle) -> void:
	if val not in FontStyle.values():
		push_error("invalid video font: '%s'" % val)
		return
	_video_font = val
	
	match val:
		FontStyle.PIXEL:
			_set_font("res://assets/fonts/Tiny5-Regular.ttf")
		FontStyle.READABLE:
			_clear_font()

func get_video_font() -> FontStyle:
	return _video_font


# --- main ---

func set_main_lang(val: String) -> void:
	_main_lang = val

func get_main_lang() -> String:
	return _main_lang


func set_content_warn_ack(val: bool) -> void:
	_content_warn_ack = val

func get_content_warn_ack() -> bool:
	return _content_warn_ack
