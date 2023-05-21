//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Özlem Körpe on 21.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func generateRandomAnswer() -> String {
        let randomIndex = Int.random(in: 0..<answers.count)
        return answers[randomIndex]
    }
    
    @IBAction func shakeButtonTapped(_ sender: UIButton) {
        let randomAnswer = generateRandomAnswer()
        answerLabel.text = randomAnswer
    }
}

