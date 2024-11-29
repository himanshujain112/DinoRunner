extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $Animations
const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum gameState {IDLE, RUNNING, JUMPING, DUCKING}
var currentState: gameState = gameState.IDLE

func _ready() -> void:
	global_position = Vector2i(80,516)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta


func _process(_delta: float) -> void:
	
	if GameManager.gameRunning:
		currentState = gameState.RUNNING
		checkInputs()
	else:
		currentState = gameState.IDLE

	match currentState:
		gameState.IDLE:
			# Idle animation
			anim.play("idle")
			velocity.x = 0
		gameState.RUNNING:
			# Running animation
			stand()
		gameState.JUMPING:
			# Jumping animation
			jump()
		gameState.DUCKING:
			# Ducking animation
			duck()
	move_and_slide()

func checkInputs():
	#print("checking inputs")
	if Input.is_action_pressed("jump") and is_on_floor():
		print("jump")
		currentState = gameState.JUMPING
	if Input.is_action_pressed("duck") and is_on_floor():
		print("duck")
		currentState = gameState.DUCKING
	if Input.is_action_just_released("duck") and is_on_floor():
		print("duck off")
		currentState = gameState.RUNNING

func jump():
	anim.play("jump")
	velocity.y = JUMP_VELOCITY
	print("jump called")
func duck():
	
	anim.play("duck")
	velocity.x = SPEED
	print("duck called")
func stand():
	anim.play("running")
	velocity.x = SPEED
	print("noramal run")