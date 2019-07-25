//
//  CollectionViewCell.swift
//  TestCollectionView
//
//  Created by TuanLA on 7/24/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let tagList = ["観光する(300)","泊まる(223)","おすすめ(213)","食べる(180)","自然(166)","温泉(132)","景色・鑑賞(104)","ホテル(100)","観光する(300)","泊まる(223)","おすすめ(213)","食べる(180)","自然(166)","温泉(132)","景色・鑑賞(104)","ホテル(100)","観光する(300)","泊まる(223)","おすすめ(213)"]
    let testView : UIView = {
        let view = UIView()
        return view
    }()
    
    let line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let x: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.text = "Trending Hashtag"
        return lbl
    }()
    
    let trendingTagLable: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.isEnabled = false
        btn.contentEdgeInsets = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10)
        return btn
    } ()
    
    let layout: LeftAlignedCollectionViewFlowLayout = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 200, height: 30)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    lazy var collectionView =  DynamicHeightCollectionView(frame: .zero, collectionViewLayout: self.layout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        collectionView.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isScrollEnabled = false
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(trendingTagLable)
        self.addSubview(line)
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            trendingTagLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            trendingTagLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            trendingTagLable.heightAnchor.constraint(equalToConstant: 50),
            ])
        
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            line.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            line.topAnchor.constraint(equalTo: trendingTagLable.bottomAnchor, constant: 5)
            ])
        
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            //collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            ])
    }
    
    func configure() {
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
    
}

extension CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell {
            cell.tagButton.setTitle("#\(tagList[indexPath.row])", for: .normal)
            cell.backgroundColor = .blue
            print(cell.layer.bounds.height)
            return cell
        }
        return UICollectionViewCell()
    }
    // min space between each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
