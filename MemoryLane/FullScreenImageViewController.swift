//
// Created by Tanisha Rastogi on 21/05/20224


import UIKit

class FullScreenImageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    private var images: [Data]
    private var initialIndex: Int
    private var pageViewController: UIPageViewController!

    init(images: [Data], initialIndex: Int) {
        self.images = images
        self.initialIndex = initialIndex
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        setupNavigationBar()

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        if let startingViewController = viewControllerAtIndex(initialIndex) {
            pageViewController.setViewControllers([startingViewController], direction: .forward, animated: false, completion: nil)
        }

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }

    private func setupNavigationBar() {
        self.navigationItem.title = "Photos"
        let backButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    private func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        guard index >= 0 && index < images.count else { return nil }
        
        let imageVC = UIViewController()
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Event.dataToImage(images[index])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tag = index
        
        imageVC.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageVC.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageVC.view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageVC.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageVC.view.trailingAnchor)
        ])
        
        return imageVC
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return images.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return initialIndex
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController.view.subviews.first as? UIImageView)?.tag ?? 0
        index -= 1
        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController.view.subviews.first as? UIImageView)?.tag ?? 0
        index += 1
        return viewControllerAtIndex(index)
    }
}
