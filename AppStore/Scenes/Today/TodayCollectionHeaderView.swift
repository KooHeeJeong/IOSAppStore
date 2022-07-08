//
//  TodayCollectionHeaderView.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/08.
//

import SnapKit
import UIKit

//Header 와 Footer를 사용하려면 반드시 UICollectionResuableView 를 상속 해줘야함
final class TodayCollectionHeaderView : UICollectionReusableView {
    //Date 라벨
    private lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.text = "7월 8일 금요일"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    //Title 라벨
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        
        return label
    }()
    
    func setupView() {
        [dateLabel,titleLabel].forEach { addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32.0)
        }
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
    }
}

