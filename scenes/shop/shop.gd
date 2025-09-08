extends Node2D

class_name Shop

signal cash_register_value_entered(amount: int)

@onready var counter: Counter = $Counter

func _ready() -> void:
	cash_register_value_entered.connect(_on_register_value_entered)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var pricelist = $CanvasLayer2/PriceList
		if pricelist.visible:
			pricelist.visible = false
		
		var cash_keyboard := $CanvasLayer2/CashKeyboard as Node2D
		if cash_keyboard.visible:
			cash_keyboard.visible = false

func _on_register_value_entered(val: int) -> void:
	if val > counter.total_in_cents:
		print("error: too much money!")
	elif val < counter.total_in_cents:
		print("error: too less money!")
	else:
		print("correct money!")
