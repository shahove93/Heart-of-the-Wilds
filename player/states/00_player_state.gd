@icon("res://player/states/state.svg")
class_name PlayerState extends Node

var player : Player
var next_state : PlayerState

#region /// ссылка на все остальные состояния
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
@onready var crouch: PlayerStateCrouch = %Crouch
#endregion



func init() -> void:
	pass


# Что происходит, когда мы входим в это состояние
func enter() -> void:
	pass

# Что происходит, когда мы выходим из этого состояния
func exit() -> void:
	pass


# Функция, которая обрабатывает то, что происходит при нажатии и отпускании кнопки
func handle_input( _event: InputEvent ) -> PlayerState:
	return next_state



#Что происходит при каждом нажатии процесса в этом состоянии
func process( _delta: float ) -> PlayerState:
	return next_state


#Что происходит при каждом тике физического_процесса в этом состоянии
func physics_process( _delta: float ) -> PlayerState:
	return next_state
