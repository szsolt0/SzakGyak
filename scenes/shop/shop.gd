extends Node2D

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var pricelist = $CanvasLayer2/PriceList
		if pricelist.visible:
			pricelist.visible = false
