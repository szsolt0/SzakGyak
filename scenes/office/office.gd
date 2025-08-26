extends Node2D

@onready var boss = $Boss
@onready var paper = $Paper
@onready var idcard = $Idcard
@onready var text_layer = $Text  # CanvasLayer
@onready var message_label = $Text/Label  # A Label a CanvasLayer-en

var boss_speed := 200.0
var boss_target_x := 0.0
var boss_moving := false

var paper_moving := false
var idcard_moving := false
var item_speed := 75.0

# Relatív eltolások a Boss-tól
var paper_offset := Vector2(50, 0)
var idcard_offset := Vector2(10, 0)

# Fix célpozíciók a tárgyaknak
var paper_target_pos := Vector2.ZERO
var idcard_target_pos := Vector2.ZERO

func _ready():
	start_boss_event(400)

func start_boss_event(target_x: float):
	boss_target_x = target_x
	boss_moving = true
	boss.get_node("AnimatedSprite2D").play("walk")

func _process(delta):
	# --- Boss mozgás ---
	if boss_moving:
		var distance = boss_speed * delta
		if boss.position.x + distance >= boss_target_x:
			boss.position.x = boss_target_x
			boss_moving = false
			boss.get_node("AnimatedSprite2D").stop()
			
			# Üzenet megjelenítése a CanvasLayer-en
			show_boss_message("Van egy munkád, indulj dolgozni!")

			# Rögzítjük a célpozíciókat a tárgyaknak
			paper_target_pos = boss.position + paper_offset
			idcard_target_pos = boss.position + idcard_offset * 0.5  # fele távolság
			# Indítjuk a tárgyak mozgását
			paper_moving = true
			idcard_moving = true
		else:
			boss.position.x += distance

	# --- Paper mozgás ---
	if paper_moving:
		paper.position.x = lerp(paper.position.x, paper_target_pos.x, 0.1)
		if abs(paper.position.x - paper_target_pos.x) < 1:
			paper.position.x = paper_target_pos.x
			paper_moving = false

	# --- Idcard mozgás ---
	if idcard_moving:
		idcard.position.x = lerp(idcard.position.x, idcard_target_pos.x, 0.1)
		if abs(idcard.position.x - idcard_target_pos.x) < 1:
			idcard.position.x = idcard_target_pos.x
			idcard_moving = false

# --- Függvény az üzenet megjelenítésére ---
func show_boss_message(message: String):
	message_label.text = message
