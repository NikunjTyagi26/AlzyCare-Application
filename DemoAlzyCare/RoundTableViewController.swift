//
//  RoundTableViewController.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 08/06/24.
//

import UIKit
import SwiftUI

class RoundTableViewController: UIViewController {
    
    @IBOutlet var stoyrBoardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        presentSwiftUIView()
     
        
        let contentView = HomeView()

               let hostingController = UIHostingController(rootView: contentView)
                       
               // Add the hostingController as a child view controller
               addChild(hostingController)
               hostingController.view.translatesAutoresizingMaskIntoConstraints = false
               stoyrBoardView.addSubview(hostingController.view)

               // Add constraints to fill the parent view
               NSLayoutConstraint.activate([
                   hostingController.view.topAnchor.constraint(equalTo: stoyrBoardView.topAnchor),
                   hostingController.view.leadingAnchor.constraint(equalTo: stoyrBoardView.leadingAnchor),
                   hostingController.view.trailingAnchor.constraint(equalTo: stoyrBoardView.trailingAnchor),
                   hostingController.view.bottomAnchor.constraint(equalTo: stoyrBoardView.bottomAnchor)
               ])
               
               // Notify the hostingController
               hostingController.didMove(toParent: self)
        
    }
}
