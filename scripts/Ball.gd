extends KinematicBody2D

const BALL_SPEED = 400
var speed = BALL_SPEED
var velocity = Vector2()

onready var initial_pos = self.position

func reset():
	position = initial_pos
	speed = BALL_SPEED
	velocity = Vector2()
	randomize()
	var rnd = rand_range(-10,10)
	velocity.x = rnd
	randomize()
	rnd = rand_range(-10,10)
	velocity.y = rnd
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if (collision.collider.has_method("score")):
			collision.collider.score()
			reset()

func _ready():
	reset()