//
//  resultViewController.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 10/06/24.
//


import UIKit

class resultViewController: UIViewController {
    
    var flag : Bool = true
   
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    var highScore: Int = 0
    var message: String = ""
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        // hide navbar
      navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Show the navigation bar on other view controllers
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if flag{
            countActivities += 1
            flag = false
        }
        // Do any additional setup after loading the view.
        setupScene()
        
    }
    
    func setupScene() {
        messageLabel.text = message
        playAgainButton.layer.masksToBounds = true
        playAgainButton.layer.cornerRadius = 20
        
        playAgainButton.backgroundColor = UIColor.init(displayP3Red: 30, green: 30, blue: 30, alpha: 0.4)
        sceneView.backgroundColor = UIColor(red: 194.0/255.0, green: 179.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        
        scoreLabel.text = String(highScore)+" points"
    }
    
    @IBAction func playAgain(_ sender: Any) {
//        let navigationController = self.presentingViewController as? UINavigationController
//
//        self.dismiss(animated: false) {
//          let _ = navigationController?.popToRootViewController(animated: false)
//        }
//
//
    }
    
    
    
 
}

