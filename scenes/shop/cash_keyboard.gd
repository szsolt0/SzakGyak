extends Sprite2D

@onready var digits: Array[TextureRect] = [
	# yes, this is the correct order!
	$Display/Digit4,
	$Display/Digit3,
	$Display/Digit2,
	$Display/Digit1,
	$Display/Digit0,
]

# rollover value, aka the think you have to take the remainder to not "overflow"
# the cash register. this is to prevent having values that cannot fit in the
# display.
@onready var ROLLOVER_VALUE: int = 10 ** digits.size()
# the max value of the register
@onready var MAX_VALUE: int = ROLLOVER_VALUE - 1

@onready var digit_textures: Array[CompressedTexture2D] = [
	# since preload(...) only works with string *constants*, there's no way to
	# make this sorter :(
	preload("res://assets/textures/shop/0.png"),
	preload("res://assets/textures/shop/1.png"),
	preload("res://assets/textures/shop/2.png"),
	preload("res://assets/textures/shop/3.png"),
	preload("res://assets/textures/shop/4.png"),
	preload("res://assets/textures/shop/5.png"),
	preload("res://assets/textures/shop/6.png"),
	preload("res://assets/textures/shop/7.png"),
	preload("res://assets/textures/shop/8.png"),
	preload("res://assets/textures/shop/9.png"),
]

@onready var value_in_cents = 0

func _ready() -> void:
	pass

func display_number(val: int) -> void:
	for digit in digits:
		digit.texture = digit_textures[val % 10]
		val /= 10

func set_value(val: int) -> void:
	value_in_cents = val % ROLLOVER_VALUE
	display_number(value_in_cents)
	
	print("current cash register value: ", value_in_cents)

# "append" as in putting the digit at the end of the number (in base 10)
# `x` must be a single digit (in base 10)
func append_digit(x: int) -> void:
	x = clampi(x, 0, 9)
	set_value((value_in_cents * 10) + x)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.keycode:
			KEY_0, KEY_KP_0: append_digit(0)
			KEY_1, KEY_KP_1: append_digit(1)
			KEY_2, KEY_KP_2: append_digit(2)
			KEY_3, KEY_KP_3: append_digit(3)
			KEY_4, KEY_KP_4: append_digit(4)
			KEY_5, KEY_KP_5: append_digit(5)
			KEY_6, KEY_KP_6: append_digit(6)
			KEY_7, KEY_KP_7: append_digit(7)
			KEY_8, KEY_KP_8: append_digit(8)
			KEY_9, KEY_KP_9: append_digit(9)
			KEY_A: ($"../.." as Shop).cash_register_value_entered.emit(value_in_cents)
			KEY_BACKSPACE: set_value(value_in_cents / 10)
