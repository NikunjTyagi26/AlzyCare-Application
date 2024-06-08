import Foundation
import UIKit

class HorizontalCalendarView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var collectionView: UICollectionView!
    private let days = Array(1...30)
    private var selectedIndexPath: IndexPath?
    private let currentDate = Calendar.current.component(.day, from: Date())
    private var centerIndexPath: IndexPath?
    private let numberOfDays = 30

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8

        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear

        self.addSubview(collectionView)

        // Scroll to the current date
        DispatchQueue.main.async {
            let centerIndex = self.days.firstIndex(of: self.currentDate) ?? 0
            self.centerIndexPath = IndexPath(item: centerIndex, section: 0)
            self.collectionView.scrollToItem(at: self.centerIndexPath!, at: .centeredHorizontally, animated: false)
            self.selectedIndexPath = self.centerIndexPath
            self.collectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let isCurrentDate = (days[indexPath.item] == currentDate)
        cell.configure(day: days[indexPath.item], isSelected: isCurrentDate)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: self.frame.height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let centerIndexPath = centerIndexPath else { return }

        // Calculate the offset to keep the current date at the center
        let centerOffset = CGPoint(
            x: (CGFloat(centerIndexPath.item) * (60 + 8)) - (scrollView.bounds.width / 2) + 34,
            y: scrollView.contentOffset.y
        )
        scrollView.setContentOffset(centerOffset, animated: false)
    }
}
