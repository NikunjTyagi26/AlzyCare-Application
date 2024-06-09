//
//  ViewController.swift
//  DemoAlzyCare
//
//  Created by Batch-2 on 03/06/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sugestedActivity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedCell", for: indexPath) as? SuggestedGamesCollectionViewCell
        
        cell?.suggestedImageView.image = UIImage(named: sugestedActivity[indexPath.row].image)
        cell?.suggestedLabel.text = sugestedActivity[indexPath.row].name
        
        return cell!
    }
    


    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    let alzheimerQuotesDataModel = AlzheimerQuotesDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let homeNib = UINib(nibName: "SuggestedGames", bundle: nil)
                collectionView.register(homeNib, forCellWithReuseIdentifier: "SuggestedCell")

        
        displayRandomQuote()
        addHorizontalLine1()
        addHorizontalLine2()
        
    }
    func displayRandomQuote() {
        let randomQuote = alzheimerQuotesDataModel.getRandomQuote()
        quoteLabel.text = randomQuote.quote
    }
    func addHorizontalLine1() {
        // Create the horizontal line view
        let horizontalLine = UIView()
        horizontalLine.backgroundColor = UIColor.gray
        
        // Add the horizontal line to the main view
        view.addSubview(horizontalLine)
        
        // Set the constraints
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalLine.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 200)
        ])
    }
    func addHorizontalLine2() {
        // Create the horizontal line view
        let horizontalLine = UIView()
        horizontalLine.backgroundColor = UIColor.gray
        
        // Add the horizontal line to the main view
        view.addSubview(horizontalLine)
        
        // Set the constraints
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalLine.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 370)
        ])
    }
    
    
}
