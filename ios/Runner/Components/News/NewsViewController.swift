//
//  NewsViewController.swift
//  Runner
//
//  Created by 이지현 on 2023/12/29.
//

import UIKit

class NewsViewController: UIViewController {
    var coordinatorDelegate: NewsCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToFlutter(_ sender: UIButton) {
        coordinatorDelegate?.navigateToFlutter()
    }
}
