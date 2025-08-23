extends Node

var hunger : int = 0
var stress : int = 0
var alcohol : int = 0
var reputation : int = 50
var money : int = 100  # opcionális

func increase(stat: String, value: int):
	if has_variable(stat):
		self.set(stat, self.get(stat) + value)

func decrease(stat: String, value: int):
	if has_variable(stat):
		self.set(stat, max(0, self.get(stat) - value))

func get_overall_status() -> Dictionary:
	return {
		"hunger": hunger,
		"stress": stress,
		"alcohol": alcohol,
		"reputation": reputation,
		"money": money
	}
