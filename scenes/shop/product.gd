extends Node

class_name Product

var product_name: StringName
var texture: Texture2D
var price_in_cents: int

func format_price() -> String:
	@warning_ignore("integer_division")
	return &"%d.%02d" % [price_in_cents / 100, price_in_cents % 100]

func _init(n: StringName, t: Texture2D, p: int) -> void:
	product_name = n
	texture = t
	price_in_cents = p

static var PRODUCT_LIST: Array[Product] = [
	Product.new(&"Kenyér", preload("res://assets/textures/shop/Bread.png"), 360),
	Product.new(&"Kolbász", preload("res://assets/textures/shop/Sausage.png"), 2800),
	Product.new(&"Pörkölt kávé", preload("res://assets/textures/shop/Coffe.png"), 1950),
	Product.new(&"Tej", preload("res://assets/textures/shop/Milk.png"), 310),
	Product.new(&"Liszt", preload("res://assets/textures/shop/Flour.png"), 470),
]
