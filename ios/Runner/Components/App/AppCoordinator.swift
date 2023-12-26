//
//  AppCoordinator.swift
//  Runner
//
//  Created by 이지현 on 2023/12/27.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator{ // <-- extends
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        super.init()
        self.navigationController = navigationController
    }
    
    override func start() { // override!
        super.start()
        navigateToNewsViewController() // navigate NewsViewController
    }
    
}

// 이 프로토콜들은 코디네이터간의 통신을 위한 인터페이스를 정의!

protocol NewsToAppCoordinatorDelegate: class {
    // 뉴스 뷰에서 Flutter 뷰로 네비게이션
    func navigateToFlutterViewController()
}

protocol FlutterToAppCoordinatorDelegate: class {
    // Flutter 뷰에서 뉴스 뷰로 네비게이션
    func navigateToNewsViewController()
}


// AppCoordinator의 확장
// 두 프로토콜을 준수하여, 각 프로토콜에 정의된 메서드를 구현
extension AppCoordinator: NewsToAppCoordinatorDelegate{
    func navigateToFlutterViewController(){
        let coordinator = FlutterCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        self.add(coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: FlutterToAppCoordinatorDelegate{
    func navigateToNewsViewController(){
        let coordinator = NewsCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        self.add(coordinator)
        coordinator.start()
    }
}
