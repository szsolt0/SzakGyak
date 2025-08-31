# HUD Entry for the player

extends VBoxContainer
class_name HudEntryFamily

@onready var name_label: Label = $Label
@onready var hunger_bar: ProgressBar = $Stats/HungerBar

func _load_translations() -> void:
	$Stats/HungerLabel.text = tr(&"HUD_ENTRY_HUNGER")

func _ready() -> void:
	_load_translations()

# Name
func set_family_name(f_name: String) -> void:
	name_label.text = f_name

func get_family_name() -> String:
	return name_label.text

# Hunger
func set_hunger(val: int) -> void:
	hunger_bar.value = val

func get_hunger() -> int:
	return hunger_bar.value as int
