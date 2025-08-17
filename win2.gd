extends Node2D

@onready var windowNode = get_node("/root/win")
@onready var NodeParce = get_node("/root/node")
@onready var win = windowNode.duplicate(DUPLICATE_SCRIPTS)
var JsonWin = []
# Called when the node enters the scene tree for the first time.
func _ready():
	NodeParce._geoJsonGd("Accueil.geojson")
	windowNode.position = Vector2i(1, 500)
	windowNode.size = Vector2i(500, 200)
	windowNode.borderless = true
	windowNode._geoJsonGd("AAcueil.geojson")
var openPressedEvent = false
# Called when the node enters the scene tree for the first time.
var N = true
var TimerInput = 0
func _input(event):
	var dragging = false
	var draggingOK = false
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				openPressedEvent = true
			else:
				openPressedEvent = false
				#queue_redraw()
			
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			if NodeParce.setZoom < 0.85:
				NodeParce.setZoom+=0.2
				NodeParce.sizes(1+NodeParce.setZoom)#parameter = ratio size screen
				#NodeParce._draw(NodeParce.fX)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if NodeParce.setZoom > -0.85:
				NodeParce.setZoom-=0.2
				NodeParce.get_size2(1+NodeParce.setZoom)#parameter = ratio size screen
				#NodeParce._draw(NodeParce.fX)
		if event.button_index == MOUSE_BUTTON_LEFT and !event.pressed and !N:
			N = true
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and N:
			N = false
			
			var NP = NodeParce.viag
			for v in range(len(NP)):
				
				if len(NP[v])==3:
					
					if Geometry2D.is_point_in_polygon(get_viewport().get_mouse_position(), NP[v][0]):
						if (len(NP[v][1].split(".click")) == 2 && (NP[v][1].split(".click")[1])=="_"):
							print(NP[v][1].split(".click"))
							NodeParce.fX = NP[v][1].split(".click")[0] + ".geojson"
							for inp in len(NodeParce.viag):
								remove_child(NodeParce.viag[inp][2])
							NodeParce.viag = []
							print(NodeParce.fX)
							NodeParce._geoJsonGd(NodeParce.fX)
							
						else:
							print(NP[v][1].split(".geojs"))
						if (len(NP[v][1].split(".geojs"))==2):
							var window = win.duplicate(DUPLICATE_SCRIPTS)
							window.position = NP[v][2].position
							window.size = Vector2i(350, 350)
							
							
							add_child(window)
							
							
							window.fX = NP[v][1].split(".geojs")[0] + ".geojson"
							
							window._geoJsonGd(window.fX)
							window.isWin = func ():
								window.queue_free()
							var inputText = LineEdit.new()
							inputText.text = "test"
							inputText.position = window.position
							window.add_child(inputText)

