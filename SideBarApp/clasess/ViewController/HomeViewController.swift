//
//  HomeViewController.swift
//  SideBarApp
//
//  Created by R&W on 09/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    //MARK: - Variable
    let homeButton: SideBarItem = SideBarItem(name: "Home", image: "")
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            sideBarButton.target = self.revealViewController()
            sideBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    
    
    
    
}
