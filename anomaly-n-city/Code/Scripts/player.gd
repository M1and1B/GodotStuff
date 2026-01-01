extends BaseMob
class_name Player

@export var Speed := 100
var Velocity := Vector2.ZERO
var Moving := false

func _process(delta):
	MoveOnInput()
	Physic(delta)

func MoveOnInput():
	if Input.is_action_pressed("Jump"):
		Jump()
	if Input.is_action_pressed("MoveRight"):
		Velocity.x += 5
		Moving = true
	if Input.is_action_pressed("MoveLeft"):
		Velocity.x -= 5
		Moving = true
	if Input.is_action_pressed("MoveDown"):
		Velocity.y += 5
		Moving = true
	if Input.is_action_pressed("MoveUp"):
		Velocity.y -= 5
		Moving = true

func Physic(d):
	var decceleration = 5
	var walkSpeed = Speed / 2
	print("[DEBUG] current speed is: ", Speed)
	
	if !Moving: if Speed >= decceleration: Speed -= decceleration ## Пока игрок не двигается, его скорость постоянно падает.
	if Input.is_action_pressed("Walk"):
		if !Moving: Speed = walkSpeed  ## Если игрок переключиться на режим ходьбы, пока персонаж не двигался, то значение скорости выставляется моментально.
		if Speed > walkSpeed: Speed -= 1  ## Если игрок переключается на ходьбу во время бега, то скорость понижается постепенно.
	else: if Speed < 100: Speed += 1  ## Постепенное повышение изначальной скорости, после перехода с бега на ходьбу.
	Velocity.normalized()
	position += ((Velocity * Speed) / 100) * d
	Moving = false

var jumped = Timer.new
func Jump():
	if !jumped:
		Speed += 50
		jumped = true
