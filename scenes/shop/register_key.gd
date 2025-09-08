extends TextureButton
class_name RegisterKey

var number: int
var column: int

func _init(nr: int, col: int) -> void:
	number = nr
	column = col
	texture_normal  = load("res://assets/textures/shop/btn_blk_%d.png" % nr)
	texture_pressed = load("res://assets/textures/shop/btn_blk_%d_active.png" % nr)
	print(texture_normal.get_size())
