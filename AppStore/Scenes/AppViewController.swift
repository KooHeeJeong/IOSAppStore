//
//  AppViewController.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/08.
//

import SnapKit
import UIKit

final class AppViewController : UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        //StackView 의 방향 = 세로
        stackView.axis = .vertical
        //StackView 의 서브뷰끼리의 간격만 맞춰준다.
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)

        //HIG 권장 사항
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView,
            spacingView
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        //항상 보여짐
        navigationItem.largeTitleDisplayMode = .always
        //무슨일이 있어도 항상 LargeTitle을 보여줌
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //LargeTitle 이 스크롤이 될 때 부드럽게 할 수 있는 옵션이 있는지 확인 해보기
    
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            //세로 스크롤을 하기위해 가로를 고정으로 둔다.
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
