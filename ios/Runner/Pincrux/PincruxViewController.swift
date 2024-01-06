//
//  PincruxViewController.swift
//  Runner
//
//  Created by 이지현 on 2024/01/06.
//

import UIKit
import PincruxOfferwall

class PincruxViewController: UIViewController {
    var pubkey = "" // TODO: 숨김처리
    var off : PincruxOfferwallSDK? = nil

    @IBOutlet weak var goBackBtn: UIButton!
    @IBOutlet weak var customView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initOfferwall()
        print("init")
    }
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        off?.viewtypeDelegate = self
        off?.startOfferwall(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func enterForeground() {
        self.off?.enterForeground()
    }
    
    func initOfferwall() {
        self.off = PincruxOfferwallSDK.initWithPubkeyAndUsrkey(pubkey, "pincrux_test")
        self.off?.setOfferwallType(.BAR_TYPE)
        self.off?.setViewControllerType(.ViewType)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        print("Go back and destory offerwall")
        self.off?.destroyView() // Back 버튼 클릭시 Offerwall 종료 요청
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension PincruxViewController: OfferwallViewTypeDelegate {
    func offerwallReceived(_ offerwallView: UIView) {
        self.customView.addSubview(offerwallView)
        offerwallView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: offerwallView, attribute: .top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .top, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: offerwallView, attribute: .leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: offerwallView, attribute: .trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: offerwallView, attribute: .bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .bottom, multiplier: 1, constant: 0)

        offerwallView.superview?.addConstraints([topConstraint, leadingConstraint, bottomConstraint, trailingConstraint])
    }
    
    func offerwallInitSuccess() {
        print("offerwallInitSuccess")
    }
    
    func offerwallInitFailed(_ errCode: Int) {
        print("offerwallInitFailed")
    }
    
    func offerwallAction() {
        print("offerwallAction")
    }
}

//extension PincruxViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        if viewController != self {
//            print("offerwall destroyView()")
//            self.off?.destroyView() // Back 버튼 클릭시 Offerwall 종료 요청
//        }
//    }
//}
