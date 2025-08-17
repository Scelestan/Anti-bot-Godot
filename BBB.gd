@tool
extends Node2D
var image = Image.load_from_file("res://As Pancarte.png")
var texture = ImageTexture.create_from_image(image)

# Python pour Godot
# Ceci est un premier essai de traduction du code JavaScript en Python pour Godot.

# Note: Ce code est une traduction directe et peut nécessiter des ajustements pour fonctionner dans Godot.

# Déclarations de variables
var quent = 0.05
var ekt3 = []
var ekt22 = []
var ekt2 = 0
var ev = InputEventAction.new()
var viag = []
var fX = "Accueil.geojson"
var routes = 0
var setZoom = 0
var ctx = null
var poly = null
var ppow = 1
var ppoh = 1
var hhhx = null
var hhhy = null
var hhhy22 =null
var INHeight = -900
var INWidth = -1200
var ad = []
var boula2 = null
var WII = INWidth # Remarque: sssss n'est pas défini dans Godot. Cela peut être remplacé par la largeur de la fenêtre du jeu.
var zm = false
var EH = (((INHeight * setZoom / (INHeight))))
var EW = INWidth * setZoom / (INWidth)
var Ce = ""
var ih = 0
var iw = 0
var exo = 0
var X11 = 0
var X22 = 0
var W11 = 0
var W22 = 0
var LW = 0
var LH = 0
var Ra = 1
var tbd = ""
var VI = null
var IC = null
var cadre = null
var jsonContent2
var jsonContent = null
var Xpos = 0
var Ypos = 0
var Left_pos = -0.01
var Right_pos = 0.01
var Bottom_pos = -0.1
var Top_pos = 0.1
var posXX = 900
var posYY = 1200



func CreateXfRectangle(pX, pY, id, colo, sizeX, sizeY, lien):

	var Xf = '{
"type":"Collection",
"name":"XML_doss",
"crs":{"type":"name","utilisation":{"name": "CritCanvas"}},
"item":['
	for a in range(1,len(id),1):
		sizeY *= len(id)/(a+len(id))
		for ab in range(1,len(id),1):
			
			sizeX *= len(id)/(ab+len(id))
			Xf += '{"type":"Feature","utilisation":{"id":"'
			Xf += id[a-1] + str(ab)
			Xf += '","route":"null","couleur":"'
			Xf += colo
			Xf += '","utiliser":"'
			Xf += lien + "/" + id[a-1] + str(ab)
			Xf += '","contour":"null","Ordre":"0"},"geometry":{"type":"Polygon","coordinates":'
			#var tabRec = '[[['+str(pX)+','+ str(pY+(F)+(F*2))+'],['+str(pX-sizeX)+','+ str(pY+(F)+(F*2))+'], ['+str(pX-sizeX)+', '+ str(pY-(sizeY+F)-(F*2))+'], ['+str(pX)+','+ str(pY+(sizeY+F)-(F*2))+'],['+ str(pX)+', '+str(pY+(F)+(F*2))+']]]'
			var tabRec ='
			[[[' + str(ab+(1+sizeX)/ab*sizeX)+ ', ' + str(a+(1+sizeY)/a*sizeY) + '],[' + str(ab+pY+(1+sizeX)/ab*sizeX)+ ', ' + str(a+(1+sizeY)/a*sizeY) + '],[' + str(ab+pY+(1+sizeX)/ab*sizeX)+ ', ' + str(a+pX +(1+sizeY)/a*sizeY)+ '],[' + str(ab+(1+sizeX)/ab*sizeX)+ ', ' + str(a+pX+(1+sizeY)/a*sizeY)+ '],[' + str(ab+(1+sizeX)/ab*sizeX)+ ', ' + str(a+(1+sizeY)/a*sizeY) + ']]]'
		
			Xf += tabRec
			Xf += '}} '
			if a < len(id)-1 || ab < len(id)-1:
					Xf += ','
	Xf += ']}'
	MATR.call(Xf)
	#print(Xf)
	get_size2.call(1+setZoom)
	LanceB.call(Right_pos, Bottom_pos, Left_pos, Top_pos)
	Activer.call(0.0480)
 
func MATR(Xf):
	if len(Xf.split(".geo")) == 2 && (Xf.split(".geo")[1]) == "json":
		#print(Xf)
		fX = Xf
		var fileL = FileAccess.open("res://" + Xf, FileAccess.READ)
		if !fileL:
			routes = Xf
			print("void viag")
		else:
			routes = fileL.get_as_text()
	else:
		routes = Xf
	jsonContent = JSON.new()
	jsonContent = JSON.parse_string(routes)
	jsonContent2 = jsonContent
			
		


 # Fonctions
func LanceA(geo):
	var as2 = 0
	var w1 = 0
	var x1 = 0
	var w2 = 0
	var x2 = 0
	
	if as2 == 0:
		#print(o)
		for aaaaa in range(len(geo[0])):
			if aaaaa == 0:
				w1 = float(geo[0][aaaaa][0])
				w2 = float(geo[0][aaaaa][0])
				x1 = float(geo[0][aaaaa][1])
				x2 = float(geo[0][aaaaa][1])

			for aaaa in range(len(geo[0])):
				if w1 - float(geo[0][aaaa][0]) > 0:
					pass
				else:
					w1 = float(geo[0][aaaa][0])

				if w2 - float(geo[0][aaaa][0]) < 0:
					pass
				else:
					w2 = float(geo[0][aaaa][0])

				if x1 - float(geo[0][aaaa][1]) > 0:
					pass
				else:
					x1 = float(geo[0][aaaa][1])
					

				if x2 - float(geo[0][aaaa][1]) < 0:
					pass
				else:
					x2 = float(geo[0][aaaa][1])

			var W1 = w2
			var W2 = w1
			var X1 = x1
			var X2 = x2
			return [W1,W2,X1,X2]


func LanceB(bord_Left, bord_Top, bord_Right, bord_Bottom):
	exo = len(jsonContent['item'])
	var as2 = 0
	var w1 = 0
	var x1 = 0
	var w2 = 0
	var x2 = 0
	
	for o in range(exo):
		#print(o)
		for aaaaa in range(len(jsonContent['item'][o]['geometry']['coordinates'][0])):
			if o == 0 and aaaaa == 0:
				w1 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaaa][0])
				w2 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaaa][0])
				x1 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaaa][1])
				x2 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaaa][1])

			for aaaa in range(len(jsonContent['item'][o]['geometry']['coordinates'][0])):
				if w1 - float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][0]) > 0:
					pass
				else:
					w1 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][0])

				if w2 - float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][0]) < 0:
					pass
				else:
					w2 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][0])

				if x1 - float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][1]) > 0:
					pass
				else:
					x1 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][1])
					

				if x2 - float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][1]) < 0:
					pass
				else:
					x2 = float(jsonContent['item'][o]['geometry']['coordinates'][0][aaaa][1])

			if aaaaa == len(jsonContent['item'][o]['geometry']['coordinates'][0]) - 1 and o == len(jsonContent['item']) - 1 and ekt2 == 0:
				W11 = ((w2-bord_Right) - (bord_Right+w2)) / ((bord_Right-w2) - (w2+bord_Right)) + w2
				W22 = ((w1-bord_Left) - (bord_Left+w1)) / ((bord_Left-w1) - (w1+bord_Left)) + w1
				X11 = ((x1-bord_Bottom) - (bord_Bottom+x1)) / ((bord_Bottom-x1) - (x1+bord_Bottom)) + x1
				X22 = ((x2-bord_Top) - (bord_Top+x2)) / ((bord_Top-x2) - (x2+bord_Top)) + x2
				ekt2 = 4

			if ekt2 == 4:
				ekt2 = 0
				break

		if ekt2 == 4:
			ekt2 = 0
			break



func datacollei(XXff):
	ad = viag;
	for addd in range(len(ad)):
		if ad[addd][0] == XXff:
			return ad[addd][1]
func set_Zoom(p):
	setZoom = p


func Activer(algoColo):
	
	var cnvert = func (lat, lng, l, opp2, opp):

		
		if opp2!=0:
			var e2 = float(ekt3[opp][2] + l) # eastern boundary latitude
			
			var w2 = float(ekt3[opp][1] + l) # western boundary latitude
			var n2 = float(ekt3[opp][4] + l) # north boundary longitude
			var s2 = float(ekt3[opp][3] + l) # south boundary longitude
			var nsspan = float(abs(n2 - s2))
			var ewspan = float(abs(w2 - e2))
			
			var nspix = posYY # gives you how many pixels in a lng point
			var ewpix = posXX # gives you how many pixels in a lat point
			
			var x2 = float((abs(w2 - lat)))*nspix # the difference between the western (right) edge of the box and the point in question, multiplied by pixels per point
			var y2 = float((abs(n2 - lng)))*ewpix # the difference between the northern (top) edge of the box and the point in question, multiplied by pixels per point
			
			if lat == 0:
				return y2
			elif lng == 0:
				return x2
		else:
			var e2 = float(W22) # eastern boundary latitude
			var w2 = float(W11) # western boundary latitude
			var n2 = float(X11) # north boundary longitude
			var s2 = float(X22) # south boundary longitude
			
			# calculate extents based on differences, convert to positive values
			var nsspan = abs(n2 - s2)
			var ewspan = abs(w2 - e2)
			
			var nspix = posYY/nsspan # gives you how many pixels in a lng point
			var ewpix = posXX/ewspan # gives you how many pixels in a lat point
			
			var x2 = (-(w2 - lat)) * ewpix # the difference between the western (right) edge of the box and the point in question, multiplied by pixels per point
			var y2 = ((n2 - lng)) * nspix # the difference between the northern (top) edge of the box and the point in question, multiplied by pixels per point
			
			if lat == 0:
				return y2
			elif lng == 0:
				return x2
	var smoth = func smoth(bbbb2):
		ctx = PackedVector2Array()
		#ElementById.append([bbbb2, ctx]);
		poly = []
	#ppow = ((ekt22[bbbb2][0]) - (ekt22[bbbb2][2]))
	#ppoh = ((ekt22[bbbb2][1]) - (ekt22[bbbb2][3]))
		hhhx = 0
		hhhy = 0
		hhhy22 = 0
		var geo = jsonContent2["item"][bbbb2]["geometry"]["coordinates"]
		var screen_size = LanceA.call(geo)
		var posXX2 = float(cnvert.call(0,screen_size[0],posXX, 0, bbbb2)-cnvert.call(0,screen_size[1],posXX, 0, bbbb2))
		var posYY2 = float(cnvert.call(screen_size[2],0,posYY, 0, bbbb2)-cnvert.call(screen_size[3],0,posYY, 0, bbbb2))
		for aaaa in range(len(jsonContent2["item"][bbbb2]["geometry"]["coordinates"][0])):
			hhhx = cnvert.call(0, jsonContent2["item"][bbbb2]["geometry"]["coordinates"][0][aaaa][1],Xpos, 0, bbbb2)
			hhhy = cnvert.call(jsonContent2["item"][bbbb2]["geometry"]["coordinates"][0][aaaa][0], 0,Ypos, 0, bbbb2)
			poly.append(hhhy)
			poly.append(hhhx)
		 
		
		 
		
			 
		 
		var drawsw = func ():
			
			var pattern = jsonContent2["item"][bbbb2]["utilisation"]["couleur"]
			var calcpp = null
			#print(poly[1])
			var vector = Vector2(float(poly[0]), float(poly[1]))
			ctx.push_back(vector)
			
			
			if jsonContent2["item"][bbbb2]["utilisation"]["contour"] == "arc":
				ctx.push_back(poly[0], poly[1], poly[2], poly[3], 100)
				for item in range(0, len(poly) - 1, 2):
					if item < len(poly) - 3:
						calcpp = (poly[item + 4] + poly[item + 5]) - (poly[item + 2] + poly[item + 3])
						ctx.push_back(poly[item + 2], poly[item + 3], poly[item + 4], poly[item + 5], 100)
					elif item < len(poly) - 1:
						ctx.push_back(poly[0], poly[1], poly[2], poly[3], 100)
			else:
				ctx.push_back( Vector2(float(poly[0]), float(poly[1])))
				
				for item in range(0, len(poly) - 1, 2):
					if item < len(poly) - 3:
						ctx.push_back(Vector2(float(poly[item + 2]), float(poly[item + 3])))
			
			
			var godot_blue = 0
			if len(pattern.split("#"))==1 && len(pattern.split("rgb")) == 1:
				var rng = RandomNumberGenerator.new()
				pattern = float(rng.randi_range(100, 200))
				var godot_blue_c = Color(int("("+str(pattern) + ", " + str(pattern) + ", " + str(pattern) +(",255)")))
				godot_blue = (godot_blue_c*25.5*algoColo)
				
			elif pattern.split("rgb")[0]=="":
				#print(pattern.split("rgb")[1])
				pattern = jsonContent2["item"][bbbb2]["utilisation"]["couleur"].replace("rgb", "")
				var godot_blue_c = Color(int("("+str(pattern).split(",")[0].replace('(', '') + ", " + str(pattern).split(",")[1] + ", " + str(pattern).split(",")[2].split(')')[0] +(",255)")))
				godot_blue = (godot_blue_c*25.5*algoColo)
				#print(godot_blue)
			else:
				godot_blue = Color.from_string(pattern.split("#")[1],Color(1,1,1,1))
				#var godot_blue_c = Color(int("("+str(pattern).split(",")[0].replace('(', '') + ", " + str(pattern).split(",")[1] + ", " + str(pattern).split(",")[2].split(')')[0] +(",255)")))
			#texture.position = 
			var polygon;
			if len(viag) < bbbb2+1:
				polygon = Polygon2D.new()
				# Set the polygon.
				polygon.polygon = ctx
				# Set the texture.
				
				#image = Image.load_from_file("res://As Pancarte.png", )
				#image.resize(posXX2, posYY2, 1)
				
				var posRegion = Vector2(cnvert.call(screen_size[0],0,posXX, 0, bbbb2),cnvert.call(0,screen_size[2],posYY, 0, bbbb2))
				
				polygon.set_position(posRegion)
				polygon.set_offset(-posRegion)
				var text = texture.duplicate()
				#text.rect_position(posRegion)
				text.set_image(image)
				text.set_size_override(Vector2i(posXX2, posYY2))
				
				
				#polygon.texture = text
				#polygon.texture = text
				polygon.color = godot_blue
				add_child(polygon)
				
				viag.append([ctx, jsonContent2["item"][bbbb2]["utilisation"]["id"], polygon])
				
			else:
				viag[bbbb2][0] = ctx
				viag[bbbb2][2].polygon = ctx
		
				#image = Image.load_from_file("res://As Pancarte.png", )
				#image.resize(posXX2, posYY2, 1)
				var text = texture.duplicate()
				viag[bbbb2][2].texture = text
				viag[bbbb2][2].color = godot_blue
				
				viag[bbbb2][2].set_position(Vector2(Ypos,Xpos))
			# We pass the PackedVector2Array to draw the shape.
			#draw_polygon(ctx, [godot_blue])
			#draw_polygon(ctx, [godot_blue], ctx, texture)
			
			
			#draw_polygon(ctx, colorss)
		drawsw.call()
	
	

	var json = null
	var ChargerPage = func ():
		var InitialLoadingBounds = func (frakt):
			print('test')


			
			var lA = func lA(Xf):
				
				var tbd = routes
				
			
		InitialLoadingBounds.call(routes)
		
		
		#routes = JSON.parse_string(routes)
	ChargerPage.call();

	for o in range(exo):
		
		smoth.call(o)
		#print(o)
		

	
	
	
	exo = len(jsonContent["item"])



func get_size2(ratio):
	var screen_size = get_viewport().get_visible_rect().size
	posXX = float(str(screen_size).split(",")[0].split("(")[1])*ratio
	posYY = float(str(screen_size).split(",")[1].split(")")[0])*ratio

func sizes(setZ):
	get_size2.call(1+setZ)

var rect = []
var testouille = 15
func _geoJsonGd(Geo):
	
	rect = []
	fX = Geo
	MATR.call(fX)#parameter = the name of the file geojson to load
	get_size2.call(1+setZoom)
	LanceB.call(Right_pos, Bottom_pos, Left_pos, Top_pos)# parameters = bordures in right (value positive), bottom(requiert value negative), left(requiert value negative), top(value positive) (0 = no bordure) (right and left are 0.5 = 50% but bottom and top are 5 = 50%
	#0.09,-0.05,-0.09,0.5 = 9%, 1%, 9%, 10%
	Activer.call(0.0705)#parameter = nuance color for rgb received "couleur" in the geojson
	
	
var testou = 0
func draw():
	if (len(viag) > 0):
		for inp in len(viag):
			remove_child(viag[inp][2])
		viag = []
		rect = []
	if testou == 0:
		MATR.call(fX)#parameter = the name of the file geojson to load
		get_size2.call(1+setZoom)
		LanceB.call(Right_pos, Bottom_pos, Left_pos, Top_pos)# parameters = bordures in right (value positive), bottom(requiert value negative), left(requiert value negative), top(value positive) (0 = no bordure) (right and left are 0.5 = 50% but bottom and top are 5 = 50%
		Activer.call(0.0705)
		print("been repop")
	else:
		testou += 3
		print(testou)
		for p in range(1,testou+2,1):
			rect.append("rect"+str(testou+p))
		CreateXfRectangle.call(1, 1, rect, "DataColor", PI/2, PI/2, "ID")
		print("been load")
	

	




var openPressedEvent = false
# Called when the node enters the scene tree for the first time.

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
			if setZoom < 0.85:
				setZoom+=0.2
				sizes(1+setZoom)#parameter = ratio size screen
				queue_redraw()
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if setZoom > -0.85:
				setZoom-=0.2
				get_size2(1+setZoom)#parameter = ratio size screen
				queue_redraw()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			for v in range(len(viag)):
				if viag[v][1]!="":
					if Geometry2D.is_point_in_polygon(get_viewport().get_mouse_position(), viag[v][0]):
						if len(viag[v][1].split(".click")) == 2 && ((viag[v][1].split(".click")[1])=="_"):
							fX = viag[v][1].split(".click")[0] + ".geojson"
							
							for inp in len(viag):
								remove_child(viag[inp][2])
							viag = []
							
						
						
							_geoJsonGd.call(fX)
						break;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	if (openPressedEvent):
		var screen_size = get_viewport().get_visible_rect().size
		var posiXX = float(str(screen_size).split(",")[0].split("(")[1])
		var posiYY = float(str(screen_size).split(",")[1].split(")")[0])
		Left_pos = ((float(str(get_viewport().get_mouse_position()).split(",")[0].split("(")[1])-(posiXX/2)))/posiXX/PI*-0.1
		Right_pos = ((float(str(get_viewport().get_mouse_position()).split(",")[0].split("(")[1])-(posiXX/2)))/posiXX/PI*-0.1
		Top_pos = ((float(str(get_viewport().get_mouse_position()).split(",")[1].split(")")[0])-(posiYY/2)))/posiYY/PI*1
		Bottom_pos = ((float(str(get_viewport().get_mouse_position()).split(",")[1].split(")")[0])-(posiYY/2)))/posiYY/PI*1
		var rng2 = RandomNumberGenerator.new()
		var patt2 = float(rng2.randi_range(1, 1))
		var rng3 = RandomNumberGenerator.new()
		var patt3 = float(rng3.randi_range(1, 1))
		Ypos = ((float(str(get_viewport().get_mouse_position()).split(",")[0].split("(")[1])-(posiXX/2*patt2))+(Left_pos-Right_pos)/posiXX/PI)*0.015
		Xpos = ((float(str(get_viewport().get_mouse_position()).split(",")[1].split(")")[0])-(posiYY/2*patt3))+(Bottom_pos-Top_pos)/posiYY/PI)*0.015
		for v in range(len(viag)):
			#viag[v][2].offset.x += Ypos
			#viag[v][2].offset.y += Xpos
			viag[v][2].position.x += Ypos
			viag[v][2].position.y += Xpos
			
		

	#var new_stylebox_normal = get_theme_stylebox("normal").duplicate()
	#get_theme_stylebox("normal").border_width_top = 0

# Remove the stylebox override.
	#remove_theme_stylebox_override("normal")

