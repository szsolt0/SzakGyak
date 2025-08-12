extends Control

func _load_translations() -> void:
	$MarginContainer/VBoxContainer/BigWarning.text = tr(&"TEXT_WARNING")
	$MarginContainer/VBoxContainer/LongWarning.text = tr(&"COMMUNIST_LONG_WARNING")
	$MarginContainer/VBoxContainer/AcceptButton.text = tr(&"BTN_ACCEPT")
	$MarginContainer/VBoxContainer/AntiAcceptButton.text = tr(&"BTN_NO_ACCEPT")

func _ready() -> void:
	_load_translations()


func _on_accept_button_pressed() -> void:
	GameSettings.set_content_warn_ack(true)
	GameSettings.commit()
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_anti_accept_button_pressed() -> void:
	# no accept, no play
	get_tree().quit()
