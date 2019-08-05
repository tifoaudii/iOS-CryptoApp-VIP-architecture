//
//  ProfilePresenter.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 31/07/19.
//  Copyright © 2019 own. All rights reserved.
//

import UIKit

protocol ProfilePresenterLogic {
    func presentProfileResponse(response: ShowProfile.GetProfileDetail.Response)
    func presentFailedResponse(error: ErrorResponse)
}

class ProfilePresenter: ProfilePresenterLogic {
    
    weak var viewController: ProfileViewController?
    
    func presentProfileResponse(response: ShowProfile.GetProfileDetail.Response) {
        var displayedProfile = [ProfileViewModelItem]()
        let profile = response.response
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            displayedProfile.append(nameAndPictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            displayedProfile.append(aboutItem)
        }
        
        if let email = profile.email {
            let dobItem = ProfileViewModelEmailItem(email: email)
            displayedProfile.append(dobItem)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributesItem = ProfileViewModeAttributeItem(attributes: attributes)
            displayedProfile.append(attributesItem)
        }
        
        let friends = profile.friends
        if !profile.friends.isEmpty {
            let friendsItem = ProfileViewModeFriendsItem(friends: friends)
            displayedProfile.append(friendsItem)
        }
        let viewModel = ShowProfile.GetProfileDetail.ViewModel(items: displayedProfile)
        self.viewController?.displayProfile(viewModel: viewModel)
    }
    
    func presentFailedResponse(error: ErrorResponse) {
        
    }
}

