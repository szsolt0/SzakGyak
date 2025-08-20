extends Node

# Family datas
var family_member_name: String
var hunger: int

# Constructor
func _init(name: String, h: int):
	family_member_name = name
	hunger = h

# Getters
func get_family_member_name() -> String:
	return family_member_name

func get_hunger() -> int:
	return hunger

# Setters
func set_family_member_name(name: String) -> void:
	family_member_name = name

func set_hunger(val: int) -> void:
	hunger = val

# toString / description
func get_description() -> String:
	return "Family Member: %s | Hunger: %d" % [family_member_name, hunger]
