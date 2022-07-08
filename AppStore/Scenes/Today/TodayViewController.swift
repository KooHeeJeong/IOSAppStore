//
//  TodayViewController.swift
//  AppStore
//
//  Created by 구희정 on 2022/06/27.
//

import SnapKit
import UIKit

final class TodayViewController: UIViewController {
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //Delegate , DataSource 연결
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TodayCellectionViewCell.self, forCellWithReuseIdentifier: "todayCell")
        collectionView.register(TodayCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TodayCollectionHeaderView")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //메인 View에 SubView추가
        view.addSubview(collectionView)
        
        //SnapKit Edges 설정
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//UICollectionView DataSource 연결
extension TodayViewController: UICollectionViewDataSource {
    //Section의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    //Cell의 Item 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCellectionViewCell
        
        cell?.setup()
        
        //return 값은 무조건 값이 있어야되기 때문에
        //Cell 이 nil 이거나 없다면, 빈 UICollectionViewCell() 을 뿌려준다.
        return cell ?? UICollectionViewCell()
    }
    //TodayCollection의 HeaderView 를 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "TodayCollectionHeaderView",
                for: indexPath
              ) as? TodayCollectionHeaderView
        else { return UICollectionReusableView() }
        
        header.setupView()
        
        return header
    }
    
}
//UICollecionView Delegate 연결
extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //CollectionView 의 Frame 값 - 32
        //다양한 디바이스에 대응을 할 수 있다.
        //동일 width 값을 return 함으로써 정사각형을 만들 수 있다.
        let width = collectionView.frame.width - 32.0
        
        return CGSize(width: width, height: width)
    }
    
    //Header 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width - 32.0
        let height: CGFloat = 100.0
        
        return CGSize(width: width, height: height)
    }
    //Section Header와 Footer 사이의 값
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    

}
