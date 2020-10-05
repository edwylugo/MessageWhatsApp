//
//  MainVC.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 04/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var logo: UIImageView = .customImageView(named: "logo")
    var sendMessage: UIButton = .customButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(hexString: "0B6156")
        addBody()
    }
    
    func addBody() {
        
        
        let stackView = UIStackView(arrangedSubviews: [UIView(), logo, sendMessage,UIView()])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.preencher(top: view.topAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            bottom: nil,
                            padding: .init(top: 100,
                                           left: 16,
                                           bottom: 0,
                                           right: 16))
    }
}
