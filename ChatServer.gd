extends Node

var server = TCPServer.new()
var clients = []
var port = 4242

func _ready():
	start_server()

func start_server():
	var error = server.listen(port)
	if error != OK:
		print("Failed to start server:", error)
		return
	print("Server started on port", port)
	set_process(true)
	start_polling()
var poll_timer
func start_polling():
	poll_timer = get_tree().create_timer(0.5)
	poll_timer.connect("timeout", Callable(self, "process"))  # Activer le processus principal pour exécuter la fonction process()

func process():
	if server.is_connection_available():
		var client = server.take_connection()
		clients.append(client)
		print("New client connected")
	
	var disconnected_clients = []

	for client in clients:
		
		if client.get_status() == StreamPeerTCP.STATUS_CONNECTED:
			
			if client.get_available_bytes() != 0:
				print(client.get_available_bytes())
				var message = (client.get_utf8_string())
				print(message)
				if message != "":
				
					broadcast_message(message, client)
		else:
			print("Client disconnected")
			disconnected_clients.append(client)
	start_polling()
	# Supprimer les clients déconnectés de la liste
	for client in disconnected_clients:
		clients.erase(client)

func broadcast_message(message, sender):
	for client in clients:
		# Ne renvoie pas le message à l'expéditeur original

		client.put_utf8_string(message)
		client.poll()
