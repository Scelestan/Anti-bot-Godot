extends Node

var socket: StreamPeerTCP
var host = "127.0.0.1"
var port = 4242

func _ready():
	socket = StreamPeerTCP.new()
	var error = socket.connect_to_host(host, port)
	
	if error != OK:
		print("Error connecting to host:", error)
		return
	print("Connected to host:", host, "port:", port)
	$Button.connect("pressed", Callable(self, "_on_selection_button_pressed"))
	set_process(true)  # Désactiver le processus principal pour utiliser un timer
	print("Trying to connect to %s:%d" % [host, port])
	start_polling()
var poll_timer
func start_polling():
	poll_timer = get_tree().create_timer(1)
	poll_timer.connect("timeout", Callable(self, "process"))

func _on_selection_button_pressed():
	var blabla = $LineEdit.text
	print(blabla)
	send_message(blabla)

func process():
	if socket.get_available_bytes() != 0:
		var data = socket.get_utf8_string()
		print("Received:", data)
		$ChatLog.text = data
	start_polling()

func send_message(message):
	socket.set_no_delay(true)
	socket.put_utf8_string(message)
	socket.poll()
	print("Message sent successfully:", message)
