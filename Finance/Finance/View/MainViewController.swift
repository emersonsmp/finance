//
//  MainViewController.swift
//  Finance
//
//  Created by Emerson Sampaio on 05/05/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

