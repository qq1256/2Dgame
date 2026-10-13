extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("1. 信号触发了，进来的节点是：", body.name)
	if body.name == "Player":
		print("2. 判断通过，是玩家")
		Global.add_score(100)
		print("3. 加分完成，准备删除金币")
		queue_free()
	else:
		print("2. 判断失败，名字不是 Player")
