extends Node

@onready var bgm_player: AudioStreamPlayer
@onready var current_bgm: StringName = &""

func _ready() -> void:
	bgm_player = AudioStreamPlayer.new()
	bgm_player.autoplay = false
	bgm_player.bus = &"Music"
	add_child(bgm_player)
	bgm_player.finished.connect(_finished)

func play(name: StringName) -> void:
	# don't do anything if the correct music already plays
	if name == current_bgm:
		return
	
	current_bgm = name
	var path := &"res://assets/audio/%s.wav" % name
	var stream := load(path) as AudioStream
	
	bgm_player.stream = stream
	bgm_player.play()

func clear() -> void:
	current_bgm = &""
	bgm_player.stop()
	bgm_player.stream = null

func _finished() -> void:
	if not current_bgm.is_empty():
		bgm_player.play()
