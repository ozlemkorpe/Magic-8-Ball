//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Özlem Körpe on 21.05.2023.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var ballImageView: UIImageView!
    
    let answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Hell yes", "Yes", "Signs point to yes", "Not sure, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "It needs time", "I don't have an answer for this", "No way", "Does not look so good", "Very doubtful"]
    
    let motionManager = CMMotionManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.2
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { [weak self] (data, error) in
                if let accelerometerData = data {
                    self?.handleShakeDetection(with: accelerometerData)
                }
            }
        }
    }
    //Stop accelerometer update
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        motionManager.stopAccelerometerUpdates()
    }
    // Random answer generator
    func generateRandomAnswer() -> String {
        let randomIndex = Int.random(in: 0..<answers.count)
        return answers[randomIndex]
    }
    // Check device shake action
    func handleShakeDetection(with accelerometerData: CMAccelerometerData) {
        let acceleration = accelerometerData.acceleration
        let totalAcceleration = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2))
        let shakeThreshold: Double = 2.0
        // Check if the total acceleration is over the treshold
        if totalAcceleration >= shakeThreshold {
            // Shake the ball
            animateShake()
            // Randomize the answer
            let randomAnswer = generateRandomAnswer()
            answerLabel.text = randomAnswer
        }
    }
    
    // Shake the ball animation
    func animateShake() {
        UIView.animate(withDuration: 1.5, animations: {
            // Animation adjustments
            self.ballImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 3)
        }) { _ in
            UIView.animate(withDuration: 1.5) {
                self.ballImageView.transform = CGAffineTransform.identity
            }
        }
    }
}
