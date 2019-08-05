//
//  ProfileRouter.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 31/07/19.
//  Copyright © 2019 own. All rights reserved.
//

import UIKit

@objc protocol ProfileRouterRoutingLogic {
    func routeToScreenA(segue: UIStoryboardSegue?)
    func routeToScreenB(segue: UIStoryboardSegue?)
}

protocol ProfileRouterDataPassing {
    var dataStore: ProfileInteractorDataStore? { get }
}


class ProfileRouter: NSObject, ProfileRouterRoutingLogic, ProfileRouterDataPassing {
    
    //MARK: - Properties Here
    weak var viewController: ProfileViewController?
    var dataStore: ProfileInteractorDataStore?
    
    //MARK: - Routing Here
    func routeToScreenA(segue: UIStoryboardSegue?){
        //Routing using Storyboard
        if let segue = segue {
            
        } else {
            //Routing Programatically
            
        }
    }
    
    func routeToScreenB(segue: UIStoryboardSegue?){
        //Routing using Storyboard
        if let segue = segue {
            
        } else {
            //Routing Programatically
            
        }
    }
    
    //MARK: - Navigation Here
    func navigateToScreenA(source: ProfileViewController, destination: UIViewController) {
        
    }
    
    func navigateToScreenB(source: ProfileViewController, destination: UIViewController) {
        
    }
}

