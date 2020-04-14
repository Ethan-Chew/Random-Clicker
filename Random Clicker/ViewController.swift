//
//  ViewController.swift
//  Random Clicker
//
//  Created by Ethan Chew on 14/11/19.
//  Copyright © 2019 Ethan Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var tutorialDeclineBtn: UIButton!
    @IBOutlet weak var tutorialAcceptBtn: UIButton!
    @IBOutlet weak var tutorialBtn1: UILabel!
    @IBOutlet weak var tutorialBtn2: UILabel!
    
    var scoreAdd:Int = 0
    var timeLeft:Int = 0
    var numOfPlays:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameButton?.layer.cornerRadius = 20
        settingsButton?.layer.cornerRadius = 20
        tutorialAcceptBtn?.layer.cornerRadius = 20
        tutorialDeclineBtn?.layer.cornerRadius = 20
        
        if (numOfPlays == 0) {
            tutorialDeclineBtn.alpha = 1
            tutorialAcceptBtn.alpha = 1
            tutorialBtn1.alpha = 1
            tutorialBtn2.alpha = 1
            numOfPlays += 1
        } else {
            tutorialDeclineBtn.alpha = 0
            tutorialAcceptBtn.alpha = 0
            tutorialBtn1.alpha = 0
            tutorialBtn2.alpha = 0
            numOfPlays += 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            GameViewController().scoreAdd = scoreAdd
            GameViewController().timeLeft = timeLeft
        }
    }
    
    @IBAction func startGameButton(_ sender: Any) {
        performSegue(withIdentifier: "startGame", sender: nil)
    }
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "settings", sender: nil)
    }
    
    @IBAction func tutorialAccept(_ sender: Any) {
        performSegue(withIdentifier: "tutorial", sender: nil)
    }
    
    @IBAction func tutorialDecline(_ sender: Any) {
        tutorialDeclineBtn.alpha = 0
        tutorialAcceptBtn.alpha = 0
        tutorialBtn1.alpha = 0
        tutorialBtn2.alpha = 0
    }
}

