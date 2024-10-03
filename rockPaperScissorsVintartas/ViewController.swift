//
//  ViewController.swift
//  rockPaperScissorsVintartas
//
//  Created by Nicholas Vintartas on 10/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    var choice = 0
    
    var computerChoice = 0
    
    var losses = 0
    
    var ties = 0
    
    var wins = 0
    
    var points = 0
    
    var compPoints = 0
    
    var round = 1
    
    @IBOutlet weak var computerPoints: UILabel!
    
    @IBOutlet weak var playerPoints: UILabel!
    
    @IBOutlet weak var winnerOutlet: UILabel!
    
    @IBOutlet weak var computerImage: UIImageView!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var lossLabel: UILabel!
    
    @IBOutlet weak var tieLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var compInfoLabel: UILabel!
    
    @IBOutlet weak var playerInfoLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var gameplayInfoLabel: UILabel!
    
    func rock() {
        playerImage.image = UIImage(named: "Rock")
    }
    func paper() {
        playerImage.image = UIImage(named: "Paper")
    }
    func scissors() {
        playerImage.image = UIImage(named: "Scissors")
    }
    func rockC() {
        computerImage.image = UIImage(named: "Rock")
    }
    func paperC() {
        computerImage.image = UIImage(named: "Paper")
    }
    func scissorsC() {
        computerImage.image = UIImage(named: "Scissors")
    }
    
    func reset() {
        wins = 0
        losses = 0
        ties = 0
        winLabel.text = "Wins: \(wins)"
        tieLabel.text = "Ties: \(ties)"
        lossLabel.text = "Losses: \(losses)"
        points = 0
        compPoints = 0
        playerPoints.text = String(points)
        computerPoints.text = String(compPoints)
        computerImage.image = UIImage(named: "Box")
        playerImage.image = UIImage(named: "Box")
        compInfoLabel.isHidden = false
        playerInfoLabel.isHidden = false
        gameplayInfoLabel.isHidden = false
        winnerOutlet.text = "First to reach ten wins, wins the round"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func choiceOutlet(_ sender: Any) {
        choice = (sender as AnyObject).selectedSegmentIndex
        
    }
    
    @IBAction func shootButton(_ sender: Any) {
        
        compInfoLabel.isHidden = true
        
        playerInfoLabel.isHidden = true
        
        gameplayInfoLabel.isHidden = true
        
        computerChoice = Int.random(in: 0...2)
        
        if choice == 0 {
            if computerChoice == 0 {
                winnerOutlet.text = "Tie"
                ties = ties + 1
            }
            else if computerChoice == 1 {
                winnerOutlet.text = "You lose."
                losses = losses + 1
            }
            else if computerChoice == 2 {
                winnerOutlet.text = "You win!"
                wins = wins + 1
            }
            rock()
        }
        else if choice == 1 {
            if computerChoice == 0 {
                winnerOutlet.text = "You win!"
                wins = wins + 1
            }
            else if computerChoice == 1 {
                winnerOutlet.text = "Tie"
                ties = ties + 1
            }
            else if computerChoice == 2 {
                winnerOutlet.text = "You lose."
                losses = losses + 1
            }
            paper()
        }
        else if choice == 2 {
            if computerChoice == 0 {
                winnerOutlet.text = "You lose."
                losses = losses + 1
            }
            else if computerChoice == 1 {
                winnerOutlet.text = "You win!"
                wins = wins + 1
            }
            else if computerChoice == 2 {
                winnerOutlet.text = "Tie"
                ties = ties + 1
            }
            scissors()
        }
        if computerChoice == 0 {
            rockC()
        }
        else if computerChoice == 1 {
            paperC()
        }
        else if computerChoice == 2 {
            scissorsC()
        }
        
        winLabel.text = "Wins: \(wins)"
        tieLabel.text = "Ties: \(ties)"
        lossLabel.text = "Losses: \(losses)"
        
        if wins >= 10 {
            points = points + 1
            playerPoints.text = "Player Points: \(points)"
            winnerOutlet.text = "Round won!"
            wins = 0
            ties = 0
            losses = 0
            winLabel.text = "Wins: \(wins)"
            tieLabel.text = "Ties: \(ties)"
            lossLabel.text = "Losses: \(losses)"
            round = round + 1
            roundLabel.text = "Round: \(round)"
        }
        if losses >= 10 {
            compPoints = compPoints + 1
            computerPoints.text = "Computer Points: \(compPoints)"
            winnerOutlet.text = "Round lost..."
            wins = 0
            ties = 0
            losses = 0
            winLabel.text = "Wins: \(wins)"
            tieLabel.text = "Ties: \(ties)"
            lossLabel.text = "Losses: \(losses)"
            roundLabel.text = "Round: \(round)"
        }
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    
}

