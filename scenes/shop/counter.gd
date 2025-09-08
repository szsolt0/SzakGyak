extends GridContainer

class_name Counter

@onready var total_in_cents: int = 0

func place_product(product: Product) -> void:
	var tex := TextureRect.new()
	tex.texture = product.texture
	tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tex.custom_minimum_size = Vector2(96, 96)
	# disabe anti-aliasing
	tex.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	add_child(tex)
	
	total_in_cents += product.price_in_cents

func clear() -> void:
	for cld in get_children():
		cld.queue_free()
	
	total_in_cents = 0

func format_price(price: int) -> String:
	@warning_ignore("integer_division")
	return &"%d.%02d" % [price / 100, price % 100]

func _ready() -> void:
	randomize()  # important to seed random numbers
	
	var products := Product.PRODUCT_LIST
	var n := 3  # how many products to place
	
	for i in range(n):
		var random_index = randi() % products.size()
		var product = products[random_index]
		place_product(product)
	
	print("total price: ", format_price(total_in_cents))
