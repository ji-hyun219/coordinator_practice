//
//  PincruxViewController.swift
//  Runner
//
//  Created by 이지현 on 2024/01/06.
//

import UIKit

class PincruxViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func goToFlutter(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true) // 최상위 뷰컨트롤러로 돌아감 (= 초기화)
    }
}
