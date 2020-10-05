//
//  MainVC.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 04/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit
import WhatsAppAPI

class MainVC: UIViewController {
    
    var logo: UIImageView = .customImageView(named: "logo")
    
    let sendMessage: UIButton = {
        let button: UIButton = .customButton()
        button.setTitle("Send message", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return button
    }()
    
    let sendMessageSpecific: UIButton = {
        let button: UIButton = .customButton()
        button.setTitle("Send message to number specific", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return button
    }()
    
    let whatsapp = WhatsApp() //Framework

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(hexString: "0B6156")
        addBody()
    }
    
    func addBody() {
        let stackViewButtons = UIStackView(arrangedSubviews: [UIView(), sendMessage,sendMessageSpecific,UIView()])
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
        
        sendMessage.addTarget(self, action: #selector(openWhatsSendMessage), for: .touchUpInside)
        sendMessageSpecific.addTarget(self, action: #selector(sendWhatsNumberSpecific), for: .touchUpInside)
    }
    
    func enterMessageAlert(_ title: String,_ message: String,_ placeholder: String, _ sendNumberSpecific: Bool) {
        whatsapp.log(message: "Open Alert Enter Message")
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "\(placeholder)"
        }
        
        alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            guard let message = textField.text else { return }
            if sendNumberSpecific {
                self.whatsapp.sendMessageWhats(message: message, vc: self)
            } else {
                self.whatsapp.sendMessageNumberSpecific(message: message, vc: self)
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func openWhatsSendMessage() {
        enterMessageAlert("Message","Enter a text","Please input something", false)
    }
    
    @objc func sendWhatsNumberSpecific() {
        enterMessageAlert("Message","Enter a text number","Ex: +5551912345678", true)
    }
    
}
