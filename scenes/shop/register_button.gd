extends Area2D

@export var normal_texture: Texture2D = preload("res://assets/textures/shop/Cash_register0.png")
@export var hover_texture: Texture2D = preload("res://assets/textures/shop/Cash_register0light.png")

@onready var shop: Shop = $".."
@onready var overlay: ColorRect = $"../CanvasLayer/ColorRect"
@onready var cashkeyboard: Sprite2D = $"../CanvasLayer2/CashKeyboard"
@onready var x_button: Area2D = $"../CanvasLayer2/CashKeyboard/X"

var current_tween: Tween = null

func _ready():
	cashkeyboard.visible = false
	$Sprite2D.texture = normal_texture
	x_button.input_event.connect(_on_x_input)

func _on_x_input(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not (event is InputEventMouseButton and event.is_pressed()):
		return
	
	cashkeyboard.visible = false
	shop.cash_register_active = false
	
	if current_tween and current_tween.is_valid():
		current_tween.kill()
	current_tween = get_tree().create_tween()
	
	current_tween.finished.connect(_on_overlay_fade_out_complete)
	current_tween.tween_property(overlay, "modulate:a", 0.0, 2.0)

func _on_mouse_entered():
	if not shop.cash_register_active:
		$Sprite2D.texture = hover_texture

func _on_mouse_exited():
	$Sprite2D.texture = normal_texture

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if cashkeyboard.visible:
			return
		
		# Toggle láthatóság
		cashkeyboard.visible = true
		shop.cash_register_active = true
		_on_mouse_exited()
		
		if current_tween and current_tween.is_valid():
			current_tween.kill()
		current_tween = get_tree().create_tween()
		
		overlay.modulate.a = 0.0
		overlay.visible = true
		current_tween.tween_property(overlay, "modulate:a", 0.7, 2.0)

func _on_overlay_fade_out_complete() -> void:
	overlay.visible = false
