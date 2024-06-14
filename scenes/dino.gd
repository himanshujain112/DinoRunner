extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $Animations
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gameStarted:bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_duck:bool = false
var is_jumping : bool = false
var is_running:bool = false


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if gameStarted == true:
	# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			is_jumping = true
			is_running = false
			is_duck = false
			#velocity.y = JUMP_VELOCITY
			#anim.play("jump")
			#$jumpAud.playing = true
			
		elif Input.is_action_pressed("duck") and is_on_floor():
			is_jumping = false
			is_duck = true
			is_running = false
			#$duckCollider.disabled = false
			#$collider.disabled = true
			#anim.play("duck") 
		else:
			is_duck = false
			is_jumping = false
			is_running = true
			#$duckCollider.disabled = true
			#$collider.disabled = false
			#anim.play("running")
	else:
		anim.play("idle")
	
	#animation controller
	if is_jumping == true and anim.animation != "jump":
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		$jumpAud.playing = true
	elif is_duck == true :
		$duckCollider.disabled = false
		$collider.disabled = true
		anim.play("duck") 
	elif is_running == true and anim.animation != "running" :
		$duckCollider.disabled = true
		$collider.disabled = false
		anim.play("running")
	move_and_slide()


func _on_map_game_started():
	gameStarted = true
