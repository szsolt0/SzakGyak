extends Node

# Piotr datas
var player_name: String
var alcohol: int
var hunger: int
var stress: int
var reputation: int
var money: int
var bread: int
var vodka: int

# Construktor
func _init(p_name: String, p_alcohol: int, p_hunger: int, p_stress: int, p_reputation: int, p_money: int, p_bread: int, p_vodka: int):
	player_name = p_name
	alcohol = p_alcohol
	hunger = p_hunger
	stress = p_stress
	reputation = p_reputation
	money = p_money
	bread = p_bread
	vodka = p_vodka

# Getters
func get_player_name() -> String:
	return player_name

func get_alcohol() -> int:
	return alcohol

func get_hunger() -> int:
	return hunger

func get_stress() -> int:
	return stress

func get_reputation() -> int:
	return reputation

func get_money() -> int:
	return money

func get_bread() -> int:
	return bread

func get_vodka() -> int:
	return vodka

# Setters
func set_player_name(name: String) -> void:
	player_name = name

func set_alcohol(val: int) -> void:
	alcohol = val

func set_hunger(val: int) -> void:
	hunger = val

func set_stress(val: int) -> void:
	stress = val

func set_reputation(val: int) -> void:
	reputation = val

func set_money(val: int) -> void:
	money = val

func set_bread(val: int) -> void:
	bread = val

func set_vodka(val: int) -> void:
	vodka = val

# toString
func get_description() -> String:
	return "Player: %s | Alcohol: %d | Hunger: %d | Stress: %d | Reputation: %d | Money: %d | Bread: %d | Vodka: %d" % [player_name, alcohol, hunger, stress, reputation, money, bread, vodka]
