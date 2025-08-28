# This script manages the HUD.

extends CanvasLayer

@onready var hud := $Root
@onready var hud_tabs := $Root/Tabs
var hud_visible := false

func _load_translation() -> void:
	pass

func _ready() -> void:
	_load_translation()
	hide_hud()

func show_hud() -> void:
	hud_visible = true
	hud.position.y = 0

func hide_hud() -> void:
	var screen_height := get_viewport().size.y as int
	
	hud_visible = false
	hud.position.y = screen_height - hud_tabs.size.y

func _on_up_down_pressed() -> void:
	var screen_height := get_viewport().size.y as int
	
	if hud_visible:
		hide_hud()
	else:
		show_hud()

func _on_f_1_pressed() -> void:
	show_hud()


func _on_f_2_pressed() -> void:
	show_hud()


func _on_f_3_pressed() -> void:
	show_hud()
