//
//  ColorSequenceViewController.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 10/06/24.
//

import UIKit

import UIKit

class ColorSequenceViewController: UIViewController {
    
    var instructionsLabel: UILabel!
    var tapCounter = 0
    var imageView: UIImageView!
    
    @IBOutlet weak var buttonOneOutlet: UIButton!
    @IBOutlet weak var buttonTwoOutlet: UIButton!
    @IBOutlet weak var buttonThreeOutlet: UIButton!
    @IBOutlet weak var buttonFourOutlet: UIButton!
    @IBOutlet weak var buttonFiveOutlet: UIButton!
    @IBOutlet weak var buttonSixOutlet: UIButton!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    var userTapArray = [Int]()
    var activeSequenceArray = [Int]()
    var isGameActive = false
    var isSameArray = false
    var normalColors = [UIColor.systemRed,UIColor.systemYellow,UIColor.systemPurple,UIColor.systemGreen,UIColor.systemOrange,UIColor.systemTeal]
    
    let youWinAlert = UIAlertController(title: "You Win", message: "Congratulations You Win", preferredStyle: .alert)
    let youLoseAlert = UIAlertController(title: "You Lose", message: "Unfortunately You Lose", preferredStyle: .alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupInstructionsLabel()
        buttonOneOutlet.layer.cornerRadius = 12
        buttonTwoOutlet.layer.cornerRadius = 12
        buttonThreeOutlet.layer.cornerRadius = 12
        buttonFourOutlet.layer.cornerRadius = 12
        buttonFiveOutlet.layer.cornerRadius = 12
        buttonSixOutlet.layer.cornerRadius = 12
        
        
        startButtonOutlet.layer.cornerRadius = 8
        startButtonOutlet.layer.borderWidth = 1.0
        startButtonOutlet.layer.borderColor = UIColor.white.cgColor
        youWinAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.restartGame()
        }))
        
        youLoseAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.restartGame()
        }))
        setupImageView()
        setupbackground()
        
        }
    
    func setupbackground(){
        view.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonOneOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonTwoOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonThreeOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonFourOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonFiveOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        buttonSixOutlet.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
    }
    func setupInstructionsLabel() {
           instructionsLabel = UILabel()
           instructionsLabel.text = "Tap the start button to begin the game. Follow the sequence of colors and tap on them in same order."
           instructionsLabel.textAlignment = .center
           instructionsLabel.numberOfLines = 0
           instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
           instructionsLabel.font = UIFont.boldSystemFont(ofSize: 21)
                
        
           view.addSubview(instructionsLabel)

           NSLayoutConstraint.activate([
               instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
               instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
               instructionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
           ])
       }

       func setupImageView() {
           let image = UIImage(named: "colourSequenceGameImage")
           imageView = UIImageView(image: image)
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(imageView)

           NSLayoutConstraint.activate([
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.bottomAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: -20),
               imageView.widthAnchor.constraint(equalToConstant: 200),
               imageView.heightAnchor.constraint(equalToConstant: 200)
           ])
       }
    
    
    
    @IBAction func buttonOneWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
        
    }
    
    
    @IBAction func buttonTwoWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonThreeWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonFourWasPressed(_ sender: UIButton) {
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonFiveWasPressed(_ sender: UIButton) {
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func buttonSixWasPressed(_ sender: UIButton) {
        
        colorfulButtonWasPressed(tag: sender.tag)
    }
    
    
    @IBAction func startButtonWasPressed(_ sender: UIButton) {
        let sequenceTags = generateRandomNumber()
        activeSequenceArray = sequenceTags
        let shuffledColors = normalColors.shuffled()
        
        for i in 0..<sequenceTags.count {
            let tempButton = self.view.viewWithTag(sequenceTags[i]) as? UIButton
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 * Double(i)) {
                
                tempButton?.backgroundColor = shuffledColors[i]
                self.instructionsLabel.isHidden = true
                self.imageView.isHidden = true
                
                
            }
            
            
        }
        
    }
    
    
    func generateRandomNumber() -> [Int] {
        
        isGameActive = true
        
        startButtonOutlet.isHidden = true
        
        print("RandomNumber")
        let RandomNumber = [4,1,2,3,5,6]
        
        
        return RandomNumber.shuffled()
    }
    
    func playerTap(tag: Int) {
            tapCounter += 1  // Increment tap counter
            userTapArray.append(tag)
        }
        
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func restartGame() {
        tapCounter = 0  // Reset tap counter
        startButtonOutlet.isHidden = false
        
        buttonOneOutlet.backgroundColor = .systemBackground
        buttonTwoOutlet.backgroundColor = .systemBackground
        buttonThreeOutlet.backgroundColor = .systemBackground
        buttonFourOutlet.backgroundColor = .systemBackground
        buttonFiveOutlet.backgroundColor = .systemBackground
        buttonSixOutlet.backgroundColor = .systemBackground
        
        // Reset button titles
        buttonOneOutlet.setTitle("", for: .normal)
        buttonTwoOutlet.setTitle("", for: .normal)
        buttonThreeOutlet.setTitle("", for: .normal)
        buttonFourOutlet.setTitle("", for: .normal)
        buttonFiveOutlet.setTitle("", for: .normal)
        buttonSixOutlet.setTitle("", for: .normal)
        
        userTapArray.removeAll()
        
        userTapArray.removeAll()
        setupInstructionsLabel()
        setupImageView()
        setupbackground()
    }
    
    func colorfulButtonWasPressed(tag: Int) {
            // Register the tap
            playerTap(tag: tag)
            
            // Find the button by its tag
            if let button = self.view.viewWithTag(tag) as? UIButton {
                // Find the index of the tapped button in activeSequenceArray
                if let index = activeSequenceArray.firstIndex(of: tag) {
                    // Display the tap counter on the button
                    button.setTitle("\(index + 1)", for: .normal)  // +1 to convert zero-based index to one-based sequence number
                    button.setTitleColor(.black, for: .normal)
                }
            }
            
            // Check if the user has completed the sequence
            if activeSequenceArray.count == userTapArray.count {
                var isCorrectSequence = true
                
                // Compare the user's sequence with the active sequence
                for i in 0..<activeSequenceArray.count {
                    if i >= userTapArray.count || activeSequenceArray[i] != userTapArray[i] {
                        isCorrectSequence = false
                        break
                    }
                }
                
                // Present the appropriate alert
                DispatchQueue.main.async {
                    if isCorrectSequence {
                        self.present(self.youWinAlert, animated: true, completion: nil)
                    } else {
                        self.present(self.youLoseAlert, animated: true, completion: nil)
                    }
                }
            }
        }
    }


