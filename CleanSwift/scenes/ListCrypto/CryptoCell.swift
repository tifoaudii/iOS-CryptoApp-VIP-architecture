//
//  CryptoCell.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation
import UIKit

class CryptoCell: UITableViewCell {

    static let identifier = "crypto_cell"
    
    var data: ListCrypto.FetchCrypto.ViewModel.DisplayCrypto? {
        didSet{
            guard let data = data else { return }
            nameLabel.text = data.name
            symbolLabel.text = data.symbol
            priceLabel.text = data.priceUSD
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "Symbol"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(priceLabel)
        
        let _ = nameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 6, paddingLeft: 16, paddingBottom: 0, paddingRight: 6, width: 0, height: 24)
        let _ = symbolLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 6, width: 0, height: 24)
        let _  = priceLabel.anchor(top: symbolLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 6, paddingRight: 6, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
