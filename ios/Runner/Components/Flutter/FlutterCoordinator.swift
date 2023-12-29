//
//  FlutterCoordinator.swift
//  Runner
//
//  Created by 이지현 on 2023/12/29.
//

import Foundation
import UIKit

final class FlutterCoordinator: BaseCoordinator{
    weak var navigationController: UINavigationController?
    weak var delegate: FlutterToAppCoordinatorDelegate?
    
    override func start() {
        super.start()
        navigationController?.popToRootViewController(animated: true) // 최상위 뷰컨트롤러로 돌아감 (= 초기화)
    }
    
    init(navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
    }
    
}
