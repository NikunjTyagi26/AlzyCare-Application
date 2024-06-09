
//
// Created by Tanisha Rastogi on 21/05/20224

import UIKit

class EventDetailViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    private var event: Event

    init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupUI()
    }

    private func setupUI() {
        let eventNameLabel = UILabel()
        eventNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        eventNameLabel.text = event.name
        view.addSubview(eventNameLabel)

        let eventDateLabel = UILabel()
        eventDateLabel.font = UIFont.systemFont(ofSize: 18)
        eventDateLabel.textColor = .gray
        eventDateLabel.text = DateFormatter.localizedString(from: event.date, dateStyle: .long, timeStyle: .none)
        view.addSubview(eventDateLabel)

        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        var imageViews: [UIImageView] = []

        for (index, imageData) in event.photos.enumerated() {
            if let image = Event.dataToImage(imageData) {
                let eventImageView = UIImageView()
                eventImageView.contentMode = .scaleAspectFill
                eventImageView.clipsToBounds = true
                eventImageView.image = image
                eventImageView.isUserInteractionEnabled = true // Enable user interaction
                eventImageView.tag = index // Set tag to the current index
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
                eventImageView.addGestureRecognizer(tapGestureRecognizer)
                scrollView.addSubview(eventImageView)
                imageViews.append(eventImageView)
            }
        }

        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(index * 220) + 20)
            ])
        }

        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = event.description
        view.addSubview(descriptionLabel)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])

        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventDateLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            eventNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            eventNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 10),
            eventDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            eventDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            scrollView.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 50),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        let contentWidth = CGFloat(event.photos.count) * 220 + 20
        scrollView.contentSize = CGSize(width: contentWidth, height: 200)
    }

    @objc private func imageTapped(_ sender: UITapGestureRecognizer) {
        if let tappedImageView = sender.view as? UIImageView {
            let index = tappedImageView.tag // Get index from tag
            let fullScreenVC = FullScreenImageViewController(images: event.photos, initialIndex: index)
            let navigationController = UINavigationController(rootViewController: fullScreenVC)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
}
