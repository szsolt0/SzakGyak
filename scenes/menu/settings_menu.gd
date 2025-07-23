extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_video_quality_item_selected(index: int) -> void:
	const names = ["low", "medium", "high"]
	GameSettings.set_video("quality", names[index])


func _on_video_animations_item_selected(index: int) -> void:
	GameSettings.set_video("animations", bool(index))

func _on_video_font_item_selected(index: int) -> void:
	const names = ["pixel", "readable"]
	GameSettings.set_video("font", names[index])
