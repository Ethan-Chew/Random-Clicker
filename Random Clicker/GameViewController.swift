//
//  GameViewController.swift
//  Random Clicker
//
//  Created by Ethan Chew on 14/11/19.
//  Copyright © 2019 Ethan Chew. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var score:Int = 0
    var timeLeft:Int = 60
    var scoreAdd:Int = 1
    var timesPressed:Int = 0
    var gameCurr = false
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pressButton: UIButton!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endGame" {
            let endGameViewController = segue.destination as! EndGameViewController
            endGameViewController.timesPressed = timesPressed
            endGameViewController.timeLeft = timeLeft
            endGameViewController.score = score
            endGameViewController.scoreAdd = scoreAdd
            EndGameViewController().timesPressed = timesPressed
            EndGameViewController().score = score
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (gameCurr == true) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in // Sets Game Duration
                self.timeLeft = self.timeLeft - 1
                self.timeLeftLabel.text = "Time Left: \(self.timeLeft)s"
                
                // Set Time Left and Segue
                if (self.timeLeft <= 0) {
                    self.timeLeft = 0
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check for Random Settings
        gameCurr = true
        pressButton.layer.cornerRadius = 10
    }
    
    @IBAction func pressButton(_ sender: Any) {
        
        // Score and Number of Times Button Pressed Calculation
        timesPressed = timesPressed + 1
        score = timesPressed + scoreAdd
        
        // Set Score
        scoreLabel.text = "\(score)"
        
        // When time left = 0, perform segue
        
        if (self.timeLeft == 0) {
            gameCurr = false
            performSegue(withIdentifier: "endGame", sender: nil)
        }
        
        // Randomise the Button Position
        
        // Find the button's width and height
        let buttonWidth = pressButton.frame.width
        let buttonHeight = pressButton.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = pressButton.superview!.bounds.width
        let viewHeight = pressButton.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        pressButton.center.x = xoffset + buttonWidth / 2
        pressButton.center.y = yoffset + buttonHeight / 2
    }
    
}
