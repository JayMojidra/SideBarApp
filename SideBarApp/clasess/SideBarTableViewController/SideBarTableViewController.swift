//
//  SideBarTableViewController.swift
//  SideBarApp
//
//  Created by R&W on 09/03/22.
//

struct SideBarItem {
    var name: String
    var image: String
}

import UIKit

class SideBarTableViewController: UITableViewController {
    // MARK: - Outlet
    @IBOutlet weak var SideBarTableView: UITableView!
    // MARK: - variable
    var arrSideBarMenuItem: [SideBarItem] = []
    var selectIndex: Int = -1
    // MARK: - View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItem()
    }
    // MARK: - function
     func menuItem() {
         let profilePictuer : SideBarItem = SideBarItem(name: "Profile", image: "")
        let homeItem: SideBarItem = SideBarItem(name: "Home", image: "")
        let aboutUs: SideBarItem = SideBarItem(name: "About Us", image: "")
        arrSideBarMenuItem = [profilePictuer,homeItem,aboutUs]
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSideBarMenuItem.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
//        if indexPath.row == 0 {
//            cell.imageView?.image = UIImage(imageLiteralResourceName: "ButterFlai")
//        } else {
//            cell.textLabel?.text = arrSideBarMenuItem[indexPath.row-1].name
//        }
        cell.textLabel?.text = arrSideBarMenuItem[indexPath.row].name
        if selectIndex == indexPath.row {
            cell.backgroundColor = .purple
        } else if selectIndex == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        tableView.reloadData()
       
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "Profile", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "Home", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "AboutUs", sender: nil)
        default:
            self.performSegue(withIdentifier: "Profile", sender: nil)
        }
        
    }
    
    
}



