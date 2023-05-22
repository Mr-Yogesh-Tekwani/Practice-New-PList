//
//  SplitViewController.swift
//  Practice New PList
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let main = ViewController()
        let detail = SecViewController()
        
        let mainNav = UINavigationController(rootViewController: main)
        let detailNav = UINavigationController(rootViewController: detail)
        
        self.viewControllers = [mainNav, detailNav]
        
        self.preferredDisplayMode = .oneBesideSecondary
        
    }

}
