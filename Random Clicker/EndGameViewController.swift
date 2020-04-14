//
//  EndGameViewController.swift
//  Random Clicker
//
//  Created by Ethan Chew on 14/11/19.
//  Copyright © 2019 Ethan Chew. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    var timesPressed:Int = 0
    var score:Int = 0
    var timeLeft:Int = 60
    var scoreAdd:Int = 1

    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var numberOfClicksLabel: UILabel!
    @IBOutlet weak var gameDurationLabel: UILabel!
    @IBOutlet weak var numberOfPtsLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeaderboard" {
            let lvc = segue.destination as! LeaderboardViewController
            lvc.totalClicks = timesPressed
            lvc.score = score
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalPointsLabel.text = "\(score)"
        numberOfClicksLabel.text = "\(timesPressed)"
        gameDurationLabel.text = "Game Duration: \(timeLeft)s"
        numberOfPtsLabel.text = "Number of Points Per Click: \(scoreAdd)"
    }
    
    @IBAction func leaderboardButton(_ sender: Any) {
        performSegue(withIdentifier: "showLeaderboard", sender: nil)
    }
    
}
