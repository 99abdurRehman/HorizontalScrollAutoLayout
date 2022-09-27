//
//  PageCell.swift
//  HorizontalScrollAutoLayout
//
//  Created by AbdurRehmanNineSol on 27/09/2022.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: PageModel? {
        didSet{
            mainImage.image = UIImage.init(named: "\(page!.imageName)")
            let attributedText = NSMutableAttributedString(string: "\(page!.title)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(page!.body)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
            
            textView.attributedText = attributedText
            textView.textAlignment = .center
        }
    }
    
    private let mainImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage.init(named: "bear_first")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Start Development to bright your future", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSMutableAttributedString(string: "HorizontalScrollAutoLayout[4217:238814] [Snapshotting] Snapshotting a view", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
        textView.attributedText = attributedText
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutForCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayoutForCell() {
        
        let halfView = UIView()
        addSubview(halfView)
        halfView.translatesAutoresizingMaskIntoConstraints = false
        
        halfView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        halfView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        halfView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        halfView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        halfView.addSubview(mainImage)
        mainImage.centerXAnchor.constraint(equalTo: halfView.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: halfView.centerYAnchor).isActive = true
        mainImage.heightAnchor.constraint(equalTo: halfView.heightAnchor, multiplier: 0.5).isActive = true

        addSubview(textView)
        textView.topAnchor.constraint(equalTo: halfView.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
}

