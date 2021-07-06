//
//  ViewController.swift
//  MvvmRxSwift
//
//  Created by Len van Zyl on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    static func initStoryBoard() -> ViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }


}

