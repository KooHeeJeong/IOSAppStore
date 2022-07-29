//
//  TodayCellectionViewCell.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/01.
//

import UIKit
import Kingfisher
import SnapKit

final class TodayCellectionViewCell: UICollectionViewCell {
    
    //Title Label
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    //SubTitle Label
    private lazy var subtitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    //Description Label
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
  
    
    //contentMode - ImageView가 어떤 방식으로 표시가 될 것인지
    //clipsToBounds - clipsToBounds와 cornerRadius 설정 [모서리 둥글게]
    //layer.cornerRadius - ImageView에 Round 적용
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(today: Today) {
        setUpSubView()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        
        subtitleLabel.text = today.subTitle
        titleLabel.text = today.title
        descriptionLabel.text = today.description
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        
    }
}

private extension TodayCellectionViewCell {
    func setUpSubView() {
        [imageView,titleLabel,subtitleLabel,descriptionLabel].forEach {
            addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(subtitleLabel)
            $0.trailing.equalTo(subtitleLabel)
        }
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview().inset(24.0)
        }
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
