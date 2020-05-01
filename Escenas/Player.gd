extends Area2D


export (int) var Velocidad
var Gravedad = 100
var limite
var Movimiento = Vector2()
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	limite = get_viewport_rect().size
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Movimiento = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1000
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
		
	Movimiento.y += Gravedad
		
	position += Movimiento * delta
	
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	if $CollisionShape2D.position.x == limite.x:
		Movimiento.x == 0
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = Movimiento.x < 0
	elif Movimiento.y != 0:
		$AnimatedSprite.animation = "Walk"
	elif Movimiento.x == 0:
		$AnimatedSprite.animation = "Rest"
	elif Movimiento.y == 0:
		$AnimatedSprite.animation = "Rest"
		
