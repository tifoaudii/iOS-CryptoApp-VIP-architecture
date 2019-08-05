//
//  ListCryptoViewController.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation
import UIKit

protocol ListCryptoDisplayLogic: class {
    func displayFetchCrypto(viewModel: ListCrypto.FetchCrypto.ViewModel)
    func displayFailedFetch(message: String)
}

class ListCryptoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListCryptoDisplayLogic {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        return tv
    }()
    
    let emptyImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    var interactor: ListCryptoBussinesLogic?
    var displayedCryptos: [ListCrypto.FetchCrypto.ViewModel.DisplayCrypto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setup()
        
        self.fetchCrypto()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.navigateToProfile))
    }
    
    @objc func navigateToProfile() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func displayFetchCrypto(viewModel: ListCrypto.FetchCrypto.ViewModel) {
        
        displayedCryptos = viewModel.displayCryptos
        
        if displayedCryptos.count == 0 {
            setEmpty(image: UIImage(named: "empty-box"), text: "Maaf data belum tersedia, silhakan refresh untuk memuat data kembali")
        }
        
        tableView.reloadData()
    }
    
    func displayFailedFetch(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setup(){
        let viewController = self
        let interactor = ListCryptoInteractor()
        let presenter = ListCryptoPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func setupView(){
        self.view.backgroundColor = .white
        
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
        self.view.addSubview(tableView)
        let _ = tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setEmpty(image: UIImage?, text: String) {
        
        if view.subviews.contains(tableView){
            tableView.removeFromSuperview()
        }
        
        view.addSubview(emptyImageView)
        view.addSubview(emptyLabel)
        
        let _ = emptyImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        emptyImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let _ = emptyLabel.anchor(top: emptyImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emptyImageView.image = image
        emptyLabel.text = text
        
    }
    
    private func fetchCrypto(){
        interactor?.fethCrypto()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedCryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = displayedCryptos[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as! CryptoCell
        cell.data = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
