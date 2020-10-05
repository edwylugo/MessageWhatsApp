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
    
    let openWhats: UIButton = {
        let button: UIButton = .customButton()
        button.setTitle("Abrir Whatsapp", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return button
    }()
    
    let sendMessage: UIButton = {
        let button: UIButton = .customButton()
        button.setTitle("Enviar mensagem", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(hexString: "0B6156")
        addBody()
    }
    
    func addBody() {
        
        let stackViewButtons = UIStackView(arrangedSubviews: [UIView(), openWhats, sendMessage,UIView()])
        stackViewButtons.distribution = .fill
        stackViewButtons.axis = .vertical
        stackViewButtons.spacing = 8
        
        let stackView = UIStackView(arrangedSubviews: [UIView(), logo, stackViewButtons,UIView()])
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
        
        openWhats.addTarget(self, action: #selector(openWhatsAPI), for: .touchUpInside)
        sendMessage.addTarget(self, action: #selector(openWhatsSendMessage), for: .touchUpInside)
        
    }
    
    @objc func openWhatsAPI() {
        print("Abrir função do módulo")
    }
    
    @objc func openWhatsSendMessage() {
        print("Abrir função do módulo para enviar mensagem")
    }
    
}
