extends Node

# Family datas
var mother_hunger: int
var child1_hunger: int
var child2_hunger: int
var child3_hunger: int

# Constructor
func _init(m_hunger: int, c1_hunger: int, c2_hunger: int, c3_hunger: int):
	mother_hunger = m_hunger
	child1_hunger = c1_hunger
	child2_hunger = c2_hunger
	child3_hunger = c3_hunger

# Getters
func get_mother_hunger() -> int:
	return mother_hunger

func get_child1_hunger() -> int:
	return child1_hunger

func get_child2_hunger() -> int:
	return child2_hunger

func get_child3_hunger() -> int:
	return child3_hunger

# Setters
func set_mother_hunger(val: int) -> void:
	mother_hunger = val

func set_child1_hunger(val: int) -> void:
	child1_hunger = val

func set_child2_hunger(val: int) -> void:
	child2_hunger = val

func set_child3_hunger(val: int) -> void:
	child3_hunger = val

# toString / description
func get_description() -> String:
	return "Mother Hunger: %d | Child1 Hunger: %d | Child2 Hunger: %d | Child3 Hunger: %d" % [mother_hunger, child1_hunger, child2_hunger, child3_hunger]
