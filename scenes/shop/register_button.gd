extends Area2D

@export var normal_texture: Texture2D = preload("res://assets/textures/shop/Cash_register0.png")
@export var hover_texture: Texture2D = preload("res://assets/textures/shop/Cash_register0light.png")

func _ready():
	$Sprite2D.texture = normal_texture

func _on_mouse_entered():
	$Sprite2D.texture = hover_texture

func _on_mouse_exited():
	$Sprite2D.texture = normal_texture

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var cashkeyboard = get_node("../CanvasLayer2/CashKeyboard")
		var overlay = get_node("../CanvasLayer/ColorRect")
		
		cashkeyboard.visible = true
		overlay.modulate.a = 0.0
		
		var tween = get_tree().create_tween()
		tween.tween_property(
			overlay,
			"modulate:a",
			0.7,
			2.0
		)
