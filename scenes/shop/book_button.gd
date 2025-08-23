extends Area2D

# --- Export változók, hogy az Inspectorban is állíthatók legyenek ---
@export var normal_texture: Texture2D = preload("res://assets/textures/shop/Book.png")
@export var hover_texture: Texture2D = preload("res://assets/textures/shop/Booklight.png")

func _ready():
	$Sprite2D.texture = normal_texture

func _on_mouse_entered():
	$Sprite2D.texture = hover_texture

func _on_mouse_exited():
	$Sprite2D.texture = normal_texture

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var pricelist = get_parent().get_node("../CanvasLayer2/PriceList")
		pricelist.visible = true
