extends Node2D

# Déclaration des variables de jeu
var ih
var iw
var skelete
var loadMesh = 0
var score = 1
var mesh2
var mesh3
var mesh1
var bOUle = false
var mattt
var attaquer = 0
var verifAttaquer = 0
var hbol = true
var rotat2 = 0
var ccecfalse = true
var hbolwin = true
var ZZZ = false
var zombieznm = 0
var zombiez = []
var hhbb = true
var zedd = false
var Lliesorti
var zonezz = []
var boulii = true
var vague = 0
var clientissX = 0
var clientissY = 0

# Déclaration des sprites


var animation3

func _ready():
	# Chargement et configuration des sprites
	ih = get_viewport().get_visible_rect().size.y * 0.95
	iw = get_viewport().get_visible_rect().size.x * 0.95

	# Initialiser les vagues
	spawn_wave()
	
	# Connecter les signaux d'entrée
	Input.connect("mouse_button_down", Callable(self, "_on_mouse_down"))
	Input.connect("mouse_button_up", Callable(self, "_on_mouse_up"))

func _on_mouse_down(event):
	if event.button_index == MOUSE_BUTTON_LEFT:
		if not zedd:
			clientissX = event.position.x
			clientissY = event.position.y
			zedd = true
			print("Mouse down at: ", clientissX, ", ", clientissY)

func _on_mouse_up(event):
	if event.button_index == MOUSE_BUTTON_LEFT:
		if zedd:
			zedd = false
			print("Mouse up at: ", event.position.x, ", ", event.position.y)

func hhyIA(yhh, numm5):
	# Logique de la fonction pour gérer les attaques de zombies
	print("Attaque zombie! Position:", yhh, "Numéro:", numm5)
	# Ajouter ici la logique pour diminuer la vie du joueur, détruire des zombies, etc.

func _input(event):
	if event is InputEventMouseMotion:
		clientissX = event.position.x
		clientissY = event.position.y
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_on_mouse_down(event)
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_on_mouse_up(event)

# Fonction pour créer un zombie
func create_zombie():
	var zombie = Sprite2D.new()
	zombie.texture = load("res://zombie.png")
	var rng = RandomNumberGenerator.new()
	zombie.position = Vector2(rng.randf_range(0, iw), rng.randf_range(0, ih))
	add_child(zombie)
	zombiez.append(zombie)
	#print("Zombie created at: ", zombie.position)

# Fonction pour gérer l'apparition des vagues de zombies
func spawn_wave():
	
	create_animations_map()
	create_animations()
	vague += 1
	print("Spawning wave: ", vague)
	for i in range(vague):
		create_zombie()
		
	
func create_animations():
	
	var animation3 = Sprite2D.new()
	var image3 = load("res://perso.png")
	
	var sprite_width = image3.get_width() / 3
	var sprite_height = image3.get_height() / 4

	# Découper l'image en 12 sprites (3 colonnes et 4 lignes)
	for row in range(4):
		for col in range(3):
			var atlas_texture = AtlasTexture.new()
			atlas_texture.atlas = image3
			atlas_texture.region = Rect2(col * sprite_width, row * sprite_height, sprite_width, sprite_height)

			var sprite = Sprite2D.new()
			sprite.texture = atlas_texture

			# Positionner les sprites aléatoirement
			var rng = RandomNumberGenerator.new()
			sprite.position = Vector2(rng.randf_range(0, iw), rng.randf_range(0, ih))
			add_child(sprite)
	# Positionnement aléatoire des animations
	var rng5 = RandomNumberGenerator.new()
	animation3.position = Vector2(rng5.randf_range(0, iw), rng5.randf_range(0, ih))
			#sprites.append(sprite)
func create_animations_map():
	var animation4 = Sprite2D.new()
	var image4 = load("res://build.png")
	
	var sprite_width2 = image4.get_width() / 3
	var sprite_height2 = image4.get_height() / 2

	# Découper l'image en 12 sprites (3 colonnes et 4 lignes)
	for row in range(2):
		for col in range(3):
			var atlas_texture = AtlasTexture.new()
			atlas_texture.atlas = image4
			atlas_texture.region = Rect2(col * sprite_width2, row * sprite_height2, sprite_width2, sprite_height2)

			var sprite = Sprite2D.new()
			sprite.texture = atlas_texture

			# Positionner les sprites aléatoirement
			var rng = RandomNumberGenerator.new()
			sprite.position = Vector2(rng.randf_range(0, iw), rng.randf_range(0, ih))
			add_child(sprite)
			#sprites.append(sprite)

	# Positionnement aléatoire de l'animation
	
	



# Fonction pour mettre à jour les zombies
func update_zombies(delta):
	for zombie in zombiez:
		zombie.position.y -= 100 * delta  # Vitesse des zombies
		if zombie.position.y < 0:
			zombiez.erase(zombie)
			remove_child(zombie)
			#print("Zombie removed: ", zombie)

func _process(delta):
	# Ajout de la logique de mise à jour par frame

	# Mise à jour des zombies
	update_zombies(delta)

	# Exemple de mise à jour des attaques de zombies
	if attaquer > 0:
		verifAttaquer += delta
		if verifAttaquer >= 1:
			verifAttaquer = 0
			attaquer -= 1
			hhyIA(verifAttaquer, attaquer)

	# Gestion des vagues
	if len(zombiez)<10:
		spawn_wave.call()
