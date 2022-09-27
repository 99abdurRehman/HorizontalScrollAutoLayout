//
//  SwippingController.swift
//  HorizontalScrollAutoLayout
//
//  Created by AbdurRehmanNineSol on 27/09/2022.
//

import UIKit

 let reuseIdentifier = "Cell"

class SwippingController: UICollectionViewController {

    let pages: [PageModel] = [
    PageModel(imageName: "bear_first", title: "Start Development to bright your future", body: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    PageModel(imageName: "heart_second", title: "Start Development to bright your future", body: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    PageModel(imageName: "leaf_third", title: "Start Development to bright your future", body: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    PageModel(imageName: "leaf_third", title: "Start Development to bright your future", body: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    PageModel(imageName: "heart_second", title: "Start Development to bright your future", body: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.")
    ]
    
    let colors: [UIColor] = [.red, .blue, .green, .yellow, .gray]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.isPagingEnabled = true
        self.collectionView.backgroundColor = .white
        setupBottomBar()
    }
    
    
    // MARK: - Selector
    
     lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .systemPink
        return pageControl
    }()
    
    private var previousButton: UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("PREV", for: .normal)
        previousButton.setTitleColor(UIColor.systemGray, for: .normal)
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousButton.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        return previousButton
    }()
    
    private var nextButton: UIButton = {
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("NEXT", for: .normal)
        previousButton.setTitleColor(UIColor.systemPink, for: .normal)
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return previousButton
    }()
    
    @objc func previousAction(_ sender: Any) {
        print("Previous Tapped")
        if pageControl.currentPage != 0 {
            let indexPath = IndexPath(item: pageControl.currentPage - 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = pageControl.currentPage - 1
        }
    }

    @objc func nextAction(_ sender: Any) {
        print("Next Tapped")
        if pageControl.currentPage < pages.count - 1 {
            let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = pageControl.currentPage + 1
        }
    }
    // MARK: - Methods
    

    func setupBottomBar() {
        
        let stackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
       
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.backgroundColor = .white
    }
   

}
