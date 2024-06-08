//
//  PlannerViewController.swift
//  DemoAlzyCare
//
//  Created by Batch-2 on 03/06/24.
//



import UIKit


class PlannerViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    var count = 0
    var dayCount = 0
    
    var memoryID: String?
    var logicID: String?
    var reasoningID: String?
    var executiveID: String?
    var preferenceID: String?
    
    var RTID: String?
    var SGID: String?
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if dayCount == 14{
            return 2
        }else{
            return 5
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PlannerCollectionViewCell
        
        if  dayCount == 14{
            switch indexPath.row {
            case 0:
                cell.label.text = specialActivity[0].name
                RTID = specialActivity[0].segueID
                
            case 1:
                cell.label.text = specialActivity[1].name
                SGID = specialActivity[1].segueID
            default:
                cell.label.text = specialActivity[1].name
            }
        }else{
            switch indexPath.row {
            case 0:
                if userResult.memoryScore == .normal{
                    cell.label.text = normalActivity[0][count].name
                    cell.imageVIEW.image = UIImage(named : normalActivity[0][count].image)
                    memoryID = normalActivity[0][count].segueID
//
                }else{
                    cell.label.text = alzheimerActivity[0][count].name
                    cell.imageVIEW.image = UIImage(named : alzheimerActivity[0][count].image)
                    memoryID = alzheimerActivity[0][count].segueID
                }
            case 1:
                if userResult.logicScore == .normal{
                    cell.label.text = normalActivity[1][count].name
                    cell.imageVIEW.image = UIImage(named : normalActivity[1][count].image)
                    logicID = normalActivity[1][count].segueID
                }else{
                    cell.label.text = alzheimerActivity[1][count].name
                    cell.imageVIEW.image = UIImage(named : alzheimerActivity[1][count].image)
                    logicID = alzheimerActivity[1][count].segueID
                }
            case 2:
                if userResult.reasoningScore == .normal{
                    cell.label.text = normalActivity[2][count].name
                    cell.imageVIEW.image = UIImage(named : normalActivity[2][count].image)
                    reasoningID = normalActivity[2][count].segueID
                }else{
                    cell.label.text = alzheimerActivity[2][count].name
                    cell.imageVIEW.image = UIImage(named : alzheimerActivity[2][count].image)
                    reasoningID = alzheimerActivity[2][count].segueID
                }
            case 3:
                if userResult.executiveScore == .normal{
                    cell.label.text = normalActivity[3][count].name
                    cell.imageVIEW.image = UIImage(named : normalActivity[3][count].image)
                    executiveID = normalActivity[3][count].segueID
                }else{
                    cell.label.text = alzheimerActivity[3][count].name
                    cell.imageVIEW.image = UIImage(named : alzheimerActivity[3][count].image)
                    executiveID = alzheimerActivity[3][count].segueID
                }
            case 4:
                cell.label.text = normalActivity[4][count].name
                cell.imageVIEW.image = UIImage(named : normalActivity[4][count].image)
                preferenceID = normalActivity[4][count].segueID
                
            default:
                cell.label.text = normalActivity[0][count].name
                logicID = normalActivity[0][count].segueID
            }
        }
        
        cell.layer.cornerRadius = 10.0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.6

        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: memoryID!, sender: nil)
        case 1:
            performSegue(withIdentifier: logicID!, sender: nil)
        case 2:
            performSegue(withIdentifier: reasoningID!, sender: nil)
        case 3:
            performSegue(withIdentifier: executiveID!, sender: nil)
        case 4:
            performSegue(withIdentifier: preferenceID!, sender: nil)
        default:
            performSegue(withIdentifier: preferenceID!, sender: nil)
        }
    }

    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.tabBarItem.title = "Planner"
        self.tabBarItem.image = UIImage(systemName: "calendar")
    }
    
    @IBOutlet var activitiescollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.barTintColor = UIColor.white

            // Set the tab bar's tint color
            self.tabBarController?.tabBar.tintColor = UIColor.black
        let calendarView = HorizontalCalendarView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 60))
                self.view.addSubview(calendarView)
                
                let plannerNib = UINib(nibName: "Planner", bundle: nil)
        activitiescollectionView.register(plannerNib, forCellWithReuseIdentifier: "Cell")
        activitiescollectionView.dataSource = self
        activitiescollectionView.delegate = self
                
        activitiescollectionView.setCollectionViewLayout(generateLayout(), animated: true)
                
    }





override func viewWillAppear(_ animated: Bool) {
    let currentDate = Date()
    let calendar = Calendar.current
    
    var currentHour = calendar.component(.hour, from: currentDate)
    var currentMinute = calendar.component(.minute, from: currentDate)
    print("Hello\(currentMinute)")
    print(currentHour)

    print(count)
    print(dayCount)
    print(userResult.memoryScore)
    
    let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "dd"
       let formattedDate = dateFormatter.string(from: currentDate)
    
    
    if((startDate) != Int(formattedDate)!){
        if count == memoryN.count - 1{
            count = 0
        }else{
            count += 1
        }
        
        if dayCount == 14{
            dayCount = 0
        }else{
            dayCount += 1
        }
        activitiescollectionView.reloadData()
        startDate = Int(formattedDate)!
    }
}

    
    func generateLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets =  NSDirectionalEdgeInsets(top: 10.0, leading: 0.0, bottom: 0, trailing: 0.0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        group.contentInsets =  NSDirectionalEdgeInsets(top: 0.0, leading: 40.0, bottom: 0, trailing: 40.0)
        
        let section = NSCollectionLayoutSection(group: group)
       
        return UICollectionViewCompositionalLayout(section: section)
        
    }
}
