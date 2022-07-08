//
//  AppViewController.swift
//  AppStore
//
//  Created by 구희정 on 2022/07/08.
//

import SnapKit
import UIKit

final class AppViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        //항상 보여짐
        navigationItem.largeTitleDisplayMode = .always
        //무슨일이 있어도 항상 LargeTitle을 보여줌
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
