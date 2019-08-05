//
//  ProfileViewController.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 31/07/19.
//  Copyright © 2019 own. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDisplayLogic {
    func displayProfile(viewModel: ShowProfile.GetProfileDetail.ViewModel)
    func displayErrorMessage(message: String)
}

class ProfileViewController: UIViewController, ProfileViewControllerDisplayLogic {
    
    lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        tableView.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.identifier)
        tableView.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.identifier)
        return tableView
    }()
    
    var interactor: ProfileInteractor?
    var displayedProfile = ShowProfile.GetProfileDetail.ViewModel(items: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupViewController()
        self.getProfileDetail()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(profileTableView)
        let _ = profileTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    private func setupViewController() {
        let viewController = self
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func getProfileDetail() {
        self.interactor?.getProfileDetail()
    }
    
    func displayErrorMessage(message: String) {
        
    }
    
    func displayProfile(viewModel: ShowProfile.GetProfileDetail.ViewModel) {
        self.displayedProfile = viewModel
        print(displayedProfile)
        self.profileTableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedProfile.items[section].rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return displayedProfile.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = displayedProfile.items[indexPath.section]
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.identifier, for: indexPath) as? EmailCell {
                cell.item = item
                return cell
            }
        case .friend:
            if let item = item as? ProfileViewModeFriendsItem, let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell {
                let friend = item.friends[indexPath.row]
                cell.item = friend
                return cell
            }
        case .attribute:
            if let item = item as? ProfileViewModeAttributeItem, let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.identifier, for: indexPath) as? AttributeCell {
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
}

