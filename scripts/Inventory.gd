extends Node

var items : Dictionary = {}

func add_item(name: String, amount: int = 1):
	if not items.has(name):
		items[name] = 0
	items[name] += amount

func remove_item(name: String, amount: int = 1):
	if items.has(name):
		items[name] = max(0, items[name] - amount)
		if items[name] == 0:
			items.erase(name)

func has_item(name: String, amount: int = 1) -> bool:
	return items.has(name) and items[name] >= amount

func list_items() -> Dictionary:
	return items
