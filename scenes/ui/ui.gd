extends CanvasLayer

signal scene_change_requested(new_scene_path: String)

# Scene-ek sorrendben: balra, középre, jobbra
var scenes := [
	"res://scenes/carshop/carshop.tscn",  # bal
	"res://scenes/shop/shop.tscn",        # közép
	"res://scenes/office/office.tscn"     # jobb
]

var current_index := 1  # alapértelmezett: középső (Shop)

@onready var left_button = $Left
@onready var right_button = $Right

func _ready():
	# Signal kötés a függvény referenciával
	left_button.pressed.connect(self._on_left_pressed)
	right_button.pressed.connect(self._on_right_pressed)

func _on_left_pressed():
	current_index = (current_index - 1 + scenes.size()) % scenes.size()
	emit_signal("scene_change_requested", scenes[current_index])

func _on_right_pressed():
	current_index = (current_index + 1) % scenes.size()
	emit_signal("scene_change_requested", scenes[current_index])
