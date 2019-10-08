//
//  SettingsController.swift
//  SideMenu
//
//  Created by mac on 04/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class SettingsController: UIViewController{
    
    // MARK: - Properties
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_3x"), style: .plain, target: self, action: #selector(handleDismiss))
        
        
        
    }
    
    
}
