//
//  LeaderboardViewController.swift
//  Random Clicker
//
//  Created by Ethan Chew on 17/11/19.
//  Copyright © 2019 Ethan Chew. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet var scoreLeaderboardLabel: [UILabel]!
    @IBOutlet var clicksLeaderboardLabel: [UILabel]!
    
    var numberOfClicks: [Int] = []
    var scoreArr: [Int] = []
    
    var score:Int = 0
    var totalClicks:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        // Get Saved Results
        numberOfClicks = UserDefaults.standard.array(forKey: "numberOfClicks") as? [Int] ?? []
        scoreArr = UserDefaults.standard.array(forKey: "scoreArr") as? [Int] ?? []
        
        // Add to array
        numberOfClicks.append(totalClicks)
        scoreArr.append(score)
        
        // Array sorting
        numberOfClicks.sort()
        scoreArr.sort()
        
        // Set back the UserDefault Value
        UserDefaults.standard.set(scoreArr, forKey: "scoreArr")
        UserDefaults.standard.set(numberOfClicks, forKey: "numberOfClicks")
        
        var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        documentsPath.removeLast(9)
        documentsPath.append("Library/Preferences/")
        
         for i in 0...scoreLeaderboardLabel.count - 1 {
             if (i < scoreArr.count - 1) {
                 scoreLeaderboardLabel[i].text = String(scoreArr[i])
             } else {
                 scoreLeaderboardLabel[i].text = "No Data"
             }
         }
         for i in 0...clicksLeaderboardLabel.count - 1 {
             if (i < numberOfClicks.count - 1) {
                 clicksLeaderboardLabel[i].text = String(numberOfClicks[i])
             } else {
                 clicksLeaderboardLabel[i].text = "No Data"
             }
         }
    }
    
}
