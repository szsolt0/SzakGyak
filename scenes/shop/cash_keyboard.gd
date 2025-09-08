extends Sprite2D

@onready var shop: Shop = $"../.."

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

const BUTTON_COLUMNS: int = 5
const BUTTON_ROWS: int = 9

func make_buttons() -> void:
	var grid := $Buttons
	grid.columns = 5
	
	for i in range(BUTTON_ROWS):
		for j in range(BUTTON_COLUMNS):
			var nr := i + 1
			var col := j
			var btn = RegisterKey.new(nr, col)
			btn.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
			btn.toggle_mode = true
			btn.toggled.connect(_on_key_toggled.bind(btn))
			grid.add_child(btn)

func _on_key_toggled(pressed: bool, btn: RegisterKey) -> void:
	if pressed:
		# unpress others in the same column
		for child in $Buttons.get_children():
			if child.column == btn.column and child.number != btn.number:
				child.button_pressed = false
		
		print("Column %d → %d pressed" % [btn.column, btn.number])
		_calculate_value()

func _calculate_value() -> void:
	var v := 0
	
	for _btn in $Buttons.get_children():
		var btn := _btn as RegisterKey
		if btn.button_pressed:
			v += btn.number * (10 ** btn.column)
	
	value_in_cents = v
	display_number(value_in_cents)

func _ready() -> void:
	make_buttons()

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


func _on_checkmark_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		shop.cash_register_value_entered.emit(value_in_cents)


func _on_reset_pressed() -> void:
	for _btn in $Buttons.get_children():
		var btn := _btn as RegisterKey
		btn.set_pressed_no_signal(false)
	
	set_value(0)
