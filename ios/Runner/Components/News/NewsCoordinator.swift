//
//  NewsCoordinator.swift
//  Runner
//
//  Created by 이지현 on 2023/12/29.
//

import Foundation
import UIKit

final class NewsCoordinator: BaseCoordinator{
    weak var navigationController: UINavigationController?
    weak var delegate: NewsToAppCoordinatorDelegate?
    
    override func start() {
        super.start()
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        if let container = storyboard.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController {
            // 아래 해석: NewsViewController 의 coordinatorDelegate 는 NewsCoordinator 다!
            container.coordinatorDelegate = self
            navigationController?.pushViewController(container, animated: false) // 뉴스 화면 표시
        }
    }
    
    init(navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
    }
}

protocol NewsCoordinatorDelegate {
    func navigateToFlutter()
}

extension NewsCoordinator: NewsCoordinatorDelegate{
    func navigateToFlutter(){
        self.delegate?.navigateToFlutterViewController()
    }
}
