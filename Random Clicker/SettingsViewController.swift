//
//  SettingsViewController.swift
//  Random Clicker
//
//  Created by Ethan Chew on 14/11/19.
//  Copyright © 2019 Ethan Chew. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var timeLeft:Int = 60
    var scoreAdd:Int = 1
    
    @IBOutlet weak var gameDurationLabel: UILabel!
    @IBOutlet weak var pointsEarnedLabel: UILabel!
    @IBOutlet weak var creditsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creditsButton?.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "creditsLink" {
            
        }
    }

    
    @IBAction func gameDurationSlider(_ sender: UISlider) {
        timeLeft = Int(sender.value)
        ViewController().scoreAdd = scoreAdd
        ViewController().timeLeft = timeLeft
        print("SA \(scoreAdd)")
        print("TL \(timeLeft)")

        gameDurationLabel.text = "Current Game Duration: \(timeLeft)s" // Shows selected Game Duration
    }
    
    @IBAction func pointsEarnedPerClickSlider(_ sender: UISlider){
        scoreAdd = Int(sender.value)

        pointsEarnedLabel.text = "Current Game Duration: \(scoreAdd)s" // Shows Points Earned
    }
}
