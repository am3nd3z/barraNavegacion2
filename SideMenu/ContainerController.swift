//
//  ContainerController.swift
//  SideMenu
//
//  Created by mac on 04/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    //Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    
    //Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    //Handlers
    
    func configureHomeController() {
        
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController:self)
        
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChildViewController(menuController)
            menuController.didMove(toParentViewController: self)
            print("Se ha agregado un nuevo controlador")
            
            
            
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }){ (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectedMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectedMenuOption(menuOption: MenuOption){
        switch menuOption{
            case .Profile:
                print("Show Profile")
            case .Inbox:
                print("Show Inbox")
        case .Notifications:
                print("Notifications")
        case .Settings:
            let controller = SettingsController()
            //present(controller, animated: true, completion: nil)
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        }
       
        
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    
    
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded,menuOption: menuOption)
    }

}
