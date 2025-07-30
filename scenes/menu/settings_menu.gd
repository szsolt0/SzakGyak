extends Control

@onready var master_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/MasterVolume/Button
@onready var sfx_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/SfxVolume/Button
@onready var music_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/MusicVolume/Button
@onready var ui_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/UiVolume/Button

@onready var video_quality_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoQuality/Button
@onready var video_anim_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoAnimations/Button
@onready var video_font_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoFont/Button

const VIDEO_QUALITY_NAMES: Array = ["low", "medium", "high"]
const VIDEO_FONT_NAMES: Array = ["pixel", "readable"]

func _ready() -> void:
	var volume = GameSettings.load_volume()
	var video = GameSettings.load_video()
	var main = GameSettings.load_main()
	
	# load volume settings
	master_volume_btn.set_value_no_signal(volume.get("master"))
	sfx_volume_btn.set_value_no_signal(volume.get("sfx"))
	music_volume_btn.set_value_no_signal(volume.get("music"))
	ui_volume_btn.set_value_no_signal(volume.get("ui"))
	
	# video settings
	video_quality_btn.select(VIDEO_QUALITY_NAMES.find(video.get("quality")))
	video_anim_btn.select(video.get("animations"))
	video_font_btn.select(VIDEO_FONT_NAMES.find(video.get("font")))
	
	

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_video_quality_item_selected(index: int) -> void:
	GameSettings.set_video("quality", VIDEO_QUALITY_NAMES[index])


func _on_video_animations_item_selected(index: int) -> void:
	GameSettings.set_video("animations", bool(index))

func _on_video_font_item_selected(index: int) -> void:
	GameSettings.set_video("font", VIDEO_FONT_NAMES[index])


func _on_master_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		# print("current master volume: ", master_volume_btn.value)
		GameSettings.set_volume("master", master_volume_btn.value)

func _on_sfx_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_volume("sfx", sfx_volume_btn.value)

func _on_music_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_volume("music", music_volume_btn.value)

func _on_ui_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_volume("ui", ui_volume_btn.value)
