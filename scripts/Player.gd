extends KinematicBody2D

export (int) var playerNumber = 0
const MOVE_SPEED = 450
var speed = MOVE_SPEED
var velocity = Vector2()

func get_input():
	if Input.is_action_just_pressed("p"+str(playerNumber)+"_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("p"+str(playerNumber)+"_down"):
		velocity.y += 1
	if Input.is_action_just_released("p"+str(playerNumber)+"_up") \
	|| Input.is_action_just_released("p"+str(playerNumber)+"_down"):
		velocity.y = 0
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity*delta)

func _ready():
	pass