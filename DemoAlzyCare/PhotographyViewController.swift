//
//  PhotographyViewController.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 07/06/24.
//

import UIKit

class PhotographyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     @IBAction func submitButtonTapped(_ sender: Any) {
     }
     */
    @IBAction func submitButttonTappable(_ sender: Any) {
        let eventVC = EventViewController()
        navigationController?.pushViewController(eventVC, animated: true)
        
//        print("Action button tapped") // Debugging print statement
//        self.navigationController?.popViewController(animated: true)
//               let storyboard = UIStoryboard(name: "MemoryLane", bundle: nil)
//               guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "MemoryLaneID") as? UIViewController else {
//                   print("Error: Unable to instantiate MainTabBarController") // Debugging print statement
//                   return
//               }
//               
//               if let window = UIApplication.shared.windows.first {
//                   window.rootViewController = tabBarController
////                   UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
////               } else {
//                   print("Error: No window available") // Debugging print statement
//               }
    }
    
}
