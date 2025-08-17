extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var windowNode = get_node("/root/WindowParce")

	for i in 9:
		var window = windowNode.duplicate(DUPLICATE_SCRIPTS)
		window.position = Vector2i(550, 50*(i+2))
		window.size = Vector2i(550, 350)
		window._draw(i)
		window.borderless = true
		add_child(window)
	windowNode.position = Vector2i(-8, -8)
	windowNode.size = Vector2i(900, 900)
	windowNode._geoJsonGd("Region.geojson")

