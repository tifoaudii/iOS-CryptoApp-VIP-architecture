//
//  ProfileInteractor.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 31/07/19.
//  Copyright © 2019 own. All rights reserved.
//

import UIKit

protocol ProfileInteractorBussinesLogic {
   func getProfileDetail()
}

protocol ProfileInteractorDataStore {
    var profile: ProfileModel? { get }
}

class ProfileInteractor: ProfileInteractorBussinesLogic, ProfileInteractorDataStore {
    
    //MARK: - Properties here
    var presenter: ProfilePresenterLogic?
    var profileWorker = ProfileWorker()
    var profile: ProfileModel?
    
    //MARK: - Interactor Function here
    func getProfileDetail() {
        profileWorker.getProfileDetail { (profile) in
            self.profile = profile
            let response = ShowProfile.GetProfileDetail.Response(response: profile)
            self.presenter?.presentProfileResponse(response: response)
        }
    }
    
}

