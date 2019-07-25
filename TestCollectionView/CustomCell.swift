//
//  CustomCellCollectionViewController.swift
//  TestCollectionView
//
//  Created by TuanLA on 7/24/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let tagButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.isEnabled = false
        btn.contentEdgeInsets = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10)
        return btn
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        tagButton.layer.cornerRadius = 8
        tagButton.layer.borderColor =  UIColor.lightGray.cgColor
        tagButton.layer.borderWidth = 1
        tagButton.clipsToBounds = true
        
        self.addSubview(tagButton)
        NSLayoutConstraint.activate([
            tagButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tagButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tagButton.topAnchor.constraint(equalTo: self.topAnchor),
            tagButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
