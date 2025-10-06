extends Node2D

class_name Shop

signal cash_register_value_entered(amount: int)

@onready var counter: Counter = $Counter
@onready var cash_register_active: bool = false
@onready var correct_answers: int

func _ready() -> void:
	cash_register_value_entered.connect(_on_register_value_entered)
	var state := SaveManager.load_state(&"shop")
	
	if state.is_empty():
		SaveManager.save_state(&"shop", {&"correct_answers": 0})
		correct_answers = 0
	else:
		correct_answers = state[&"correct_answers"]

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var pricelist = $CanvasLayer2/PriceList
		if pricelist.visible:
			pricelist.visible = false

func _on_register_value_entered(val: int) -> void:
	if val > counter.total_in_cents:
		print("error: too much money!")
	elif val < counter.total_in_cents:
		print("error: too less money!")
	else:
		print("correct money!")
		correct_answers += 1
		SaveManager.save_state(&"shop", {&"correct_answers": correct_answers})
	
	print("correct answers so far: ", correct_answers)
