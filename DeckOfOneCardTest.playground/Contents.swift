import UIKit

var score: Int = 0

var strikes: Int = 0

var scores: [Int] = [4, 8]

var highScore: Int = 0

func addOnePoint() {
    score += 1
}

func addOneStrike() {
    strikes += 1
}

addOnePoint()
addOnePoint()

addOneStrike()
addOneStrike()
addOneStrike()

func checkScore(score: Int, strikes: Int) {
    print("Score: \(score) Strikes: \(strikes)")
    if strikes >= 3 {
        print("You're out")
        scores.append(score)
        print("Scores: \(scores)")
        scores.sort()
        print("Sorted scores: \(scores)")
        highScore = scores.last ?? 0
        print("High Score: \(highScore)")
    } else {
        // Continue playing
    }
}

func resetScore() {
    score = 0
    strikes = 0
}

checkScore(score: score, strikes: strikes)

resetScore()

print(score)
print(strikes)
