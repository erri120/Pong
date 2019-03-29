extends StaticBody2D

export (int) var goalID = 0
var goalsOne = 0
var goalsTwo = 0

func score():
	if goalID == 1:
		goalsOne+=1
		get_node("../ScoreOne").set_text(str(goalsOne))
	else:
		goalsTwo+=1
		get_node("../ScoreTwo").set_text(str(goalsTwo))