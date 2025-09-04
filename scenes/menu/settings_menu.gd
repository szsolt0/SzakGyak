# This script manages the Settings Menu UI.

extends Control

@onready var master_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/MasterVolume/Button
@onready var sfx_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/SfxVolume/Button
@onready var music_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/MusicVolume/Button
@onready var ui_volume_btn: HSlider = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/UiVolume/Button

@onready var video_quality_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoQuality/Button
@onready var video_anim_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoAnimations/Button
@onready var video_font_btn: OptionButton = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoFont/Button

@onready var menu_btn_translation_map: Dictionary[Node, StringName] = {
	master_volume_btn: &"SETTINGS_BTN_MASTER_VOLUME",
	sfx_volume_btn: &"SETTINGS_BTN_SFX_VOLUME",
	music_volume_btn: &"SETTINGS_BTN_MUSIC_VOLUME",
	ui_volume_btn: &"SETTINGS_BTN_UI_VOLUME",

	video_quality_btn: &"SETTINGS_BTN_VIDEO_QUALITY",
	video_anim_btn: &"SETTINGS_BTN_VIDEO_ANIMATIONS",
	video_font_btn: &"SETTINGS_BTN_VIDEO_FONT",
}

@onready var menu_labels_translation_map: Dictionary[Node, StringName] = {
	$MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VolumeLabel: &"SETTINGS_LABEL_VOLUME",
	$MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VideoLabel: &"SETTINGS_LABEL_VIDEO",
}

func _load_translations() -> void:
	for button in menu_btn_translation_map.keys():
		var label := button.get_parent().get_node("Label") as Label
		label.text = tr(menu_btn_translation_map.get(button))
	
	for label in menu_labels_translation_map.keys():
		label.text = tr(menu_labels_translation_map.get(label))
	
	# video quality names
	video_quality_btn.set_item_text(0, tr(&"GENERIC_LOW"))
	video_quality_btn.set_item_text(1, tr(&"GENERIC_MEDIUM"))
	video_quality_btn.set_item_text(2, tr(&"GENERIC_HIGH"))
	
	# video animations names
	video_anim_btn.set_item_text(0, tr(&"GENERIC_BOOL_ON"))
	video_anim_btn.set_item_text(1, tr(&"GENERIC_BOOL_OFF"))
	
	# video font names
	video_font_btn.set_item_text(0, tr(&"SETTINGS_BTN_VIDEO_FONT_PIXEL"))
	video_font_btn.set_item_text(1, tr(&"SETTINGS_BTN_VIDEO_FONT_READABLE"))

func _ready() -> void:
	_load_translations()

	# helpful shorthand
	var gs := GameSettings
	
	# load volume settings
	master_volume_btn.set_value_no_signal(gs.get_master_volume())
	sfx_volume_btn.set_value_no_signal(gs.get_sfx_volume())
	music_volume_btn.set_value_no_signal(gs.get_music_volume())
	ui_volume_btn.set_value_no_signal(gs.get_ui_volume())
	
	# video settings
	video_quality_btn.select(gs.get_video_quality())
	video_anim_btn.select(gs.get_video_animations())
	video_font_btn.select(gs.get_video_font())

func _on_back_pressed() -> void:
	GameSettings.commit()
	get_parent().remove_child(self)


func _on_video_quality_item_selected(index: int) -> void:
	GameSettings.set_video_quality(index)


func _on_video_animations_item_selected(index: int) -> void:
	GameSettings.set_video_animations(index)

func _on_video_font_item_selected(index: int) -> void:
	GameSettings.set_video_font(index)


func _on_master_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		# print("current master volume: ", master_volume_btn.value)
		GameSettings.set_master_volume(master_volume_btn.value as int)

func _on_sfx_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_sfx_volume(sfx_volume_btn.value as int)

func _on_music_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_music_volume(music_volume_btn.value as int)

func _on_ui_volume_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameSettings.set_ui_volume(ui_volume_btn.value as int)
