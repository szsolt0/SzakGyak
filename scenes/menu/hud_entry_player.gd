# HUD Entry for the player

extends VBoxContainer
class_name HudEntryPlayer

@onready var name_label: Label = $Label
@onready var hunger_bar: ProgressBar = $Stats/HungerBar
@onready var stress_bar: ProgressBar = $Stats/StressBar
@onready var alcohol_bar: ProgressBar = $Stats/AlcoholBar
@onready var reputation_bar: ProgressBar = $Stats/ReputationBar
@onready var money_bar: Label = $Stats/MoneyBar
@onready var bread_bar: ProgressBar = $Stats/BreadBar
@onready var vodka_bar: ProgressBar = $Stats/VodkaBar

func _load_translations() -> void:
	$Stats/HungerLabel.text = tr(&"HUD_ENTRY_HUNGER")
	$Stats/StressLabel.text = tr(&"HUD_ENTRY_STRESS")
	$Stats/AlcoholLabel.text = tr(&"HUD_ENTRY_ALCOHOL")
	$Stats/ReputationLabel.text = tr(&"HUD_ENTRY_REPUTATION")
	$Stats/MoneyLabel.text = tr(&"HUD_ENTRY_MONEY")
	$Stats/BreadLabel.text = tr(&"HUD_ENTRY_BREAD")
	$Stats/VodkaLabel.text = tr(&"HUD_ENTRY_VODKA")

func _ready() -> void:
	_load_translations()

# Name
func set_player_name(p_name: String) -> void:
	name_label.text = p_name

# Hunger
func set_hunger(val: int) -> void:
	print("updateing hunger: ", val)
	hunger_bar.value = val

func get_hunger() -> int:
	return hunger_bar.value as int

# Stress
func set_stress(val: int) -> void:
	stress_bar.value = val

func get_stress() -> int:
	return stress_bar.value as int

# Alcohol
func set_alcohol(val: int) -> void:
	alcohol_bar.value = val

func get_alcohol() -> int:
	return alcohol_bar.value as int

# Reputation
func set_reputation(val: int) -> void:
	reputation_bar.value = val

func get_reputation() -> int:
	return reputation_bar.value as int

# Money
func set_money(val: int) -> void:
	money_bar.text = String.num_int64(val) + " $"

func get_money() -> int:
	return money_bar.value as int

# Bread
func set_bread(val: int) -> void:
	bread_bar.value = val

func get_bread() -> int:
	return bread_bar.value as int

# Vodka
func set_vodka(val: int) -> void:
	vodka_bar.value = val

func get_vodka() -> int:
	return vodka_bar.value as int

# update multiple stats at once
func update_stats(hunger: int, stress: int, alcohol: int, reputation: int, money: int, bread: int, vodka: int) -> void:
	set_hunger(hunger)
	set_stress(stress)
	set_alcohol(alcohol)
	set_reputation(reputation)
	set_money(money)
	set_bread(bread)
	set_vodka(vodka)
