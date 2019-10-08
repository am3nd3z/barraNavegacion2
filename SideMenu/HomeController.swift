//
//  HomeController.swift
//  SideMenu
//
//  Created by mac on 04/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //Properties
    var delegate: HomeControllerDelegate?
    
    
    
    //Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
        
    }
    
    //Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = 	UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x"), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    
    
    
}
