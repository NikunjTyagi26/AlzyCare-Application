//
//  CalendarCell.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 06/06/24.
//


import Foundation
import UIKit

class CalendarCell: UICollectionViewCell {
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    private let activitiesLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(activitiesLabel)
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
//            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            activitiesLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
            activitiesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            activitiesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            activitiesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    func configure(day: Int, activities: [Activity]) {
            dayLabel.text = String(format: "%02d", day)
            let activitiesText = activities.map { $0.name }.joined(separator: "\n")
            activitiesLabel.text = activitiesText
        }

    func configure(day: Int, isSelected: Bool) {
        dayLabel.text = String(format: "%02d", day)
        if isSelected {
            contentView.backgroundColor = UIColor.systemPurple
            dayLabel.textColor = .white
        } else {
            contentView.backgroundColor = UIColor.white
            dayLabel.textColor = .darkGray
        }
    }
}
