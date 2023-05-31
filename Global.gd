extends Node

var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletInstanceCount = 0

var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "User",
	"highScores": 0,
	"highScorePlayersName" : "Winner"
}

var player
