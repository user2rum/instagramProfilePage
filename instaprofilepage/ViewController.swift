//
//  ViewController.swift
//  instaprofilepage
//
//  Created by t2023-m0075 on 2023/09/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let toDoButton = {
        let button = UIButton()
        button.setTitle("To Do Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
        button.addTarget(self, action: #selector(toDoButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    private let doneButton = {
//        let button = UIButton()
//        button.setTitle("Done Button", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.backgroundColor = .white
//        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
//        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
//
//        return button
//    }()
    
    private let profileButton = {
        let button = UIButton()
        button.setTitle("Profile Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 25)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoButtonLayout()
        //doneButtonLayout()
        profileButtonLayout()
    }
    
    func toDoButtonLayout() {
        view.addSubview(toDoButton)
        
        toDoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
//    func doneButtonLayout() {
//        view.addSubview(doneButton)
//        doneButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(100)
//        }
//
//    }
    
    func profileButtonLayout() {
        view.addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(200)
        }
    }
    
    @objc func toDoButtonTapped() {
        let todoViewController = TodoViewController()
        let navController = UINavigationController(rootViewController: todoViewController)
        slidePresent(navController)
    }
    
//    @objc func doneButtonTapped() {
//        let doneViewController = DoneViewController()
//        let navController = UINavigationController(rootViewController: doneViewController)
//        slidePresent(navController)
//    }
    
    @objc func profileButtonTapped() {
        let profileViewController = ProfilePageViewController()
        slidePresent(profileViewController)
    }
    
    func slidePresent(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false, completion: nil)
    }
    
}
