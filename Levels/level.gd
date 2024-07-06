extends Node2D

var positionBall = Vector2.ZERO
var positionPlayer = Vector2(-350, 0)
var positionOponente = Vector2(350, 0)
var pointsPlayer = 0
var pointsOponente = 0
var timeout_gol = 0.8
var timeout_start = 1

func _ready():
	$Marcador.ActualizarMarcador(pointsPlayer, pointsOponente)
	RestartGame(timeout_start)

func RestartGame(timeout = 0):
	$Ball.is_moving = false
	$Ball.position = positionBall
	#$Player.position = positionPlayer
	#$Oponente.position = positionOponente
	await get_tree().create_timer(timeout).timeout
	$Ball.ResetBall()


func _on_area_2d_body_entered(body):
	if body is Ball:
		body.get_node("AudioGol").play()
		pointsOponente += 1
		$Marcador.ActualizarMarcador(pointsPlayer, pointsOponente)
		await get_tree().create_timer(timeout_gol).timeout
		RestartGame(timeout_gol)


func _on_area_2d_body_entered_derecha(body):
	if body is Ball:
		body.get_node("AudioGol").play()
		pointsPlayer += 1
		$Marcador.ActualizarMarcador(pointsPlayer, pointsOponente)
		await get_tree().create_timer(timeout_gol).timeout
		RestartGame(timeout_gol)
