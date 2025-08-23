extends Node

signal event_triggered(event)
signal decision_made(event_id, choice)

var event_pool : Array = []

func _ready():
	# Példa események
	event_pool = [
		{
			"id": "inspect",
			"description": "A hatóság ellenőrizni akarja a lakásodat.",
			"choices": [
				{"text": "Engedd be", "consequences": {"reputation": -5, "stress": +2}},
				{"text": "Tagadd meg", "consequences": {"reputation": -10, "stress": +5}}
			]
		},
		{
			"id": "food_shortage",
			"description": "Élelmiszerhiány a boltban.",
			"choices": [
				{"text": "Vásárolj drágán a feketepiacon", "consequences": {"hunger": -3, "money": -20}},
				{"text": "Ne vegyél semmit", "consequences": {"hunger": +2}}
			]
		}
	]

func trigger_random_event():
	if event_pool.size() == 0:
		return
	var event = event_pool[randi() % event_pool.size()]
	emit_signal("event_triggered", event)

func resolve_decision(event, choice):
	emit_signal("decision_made", event["id"], choice)
	apply_consequences(choice)

func apply_consequences(choice):
	if not choice.has("consequences"):
		return
	var consequences = choice["consequences"]
	for stat in consequences.keys():
		var value = consequences[stat]
		if has_node("/root/Stats"):
			var stats = get_node("/root/Stats")
			if value > 0:
				stats.increase(stat, value)
			else:
				stats.decrease(stat, abs(value))
