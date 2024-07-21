//
//  ViewController.swift
//  KanyeRest
//
//  Created by Victor Levenetz Mariano on 27/03/24.
//

import UIKit

class ViewController: UIViewController {
    let apiManager = KanyeApi()
    
    private let button: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .systemBlue
        button.setTitle("Click", for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
        
    override func viewDidLoad() {
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setupUI()
        
    }
    private func setupUI() {
        self.view.backgroundColor = .royalBlue
        self.view.addSubview(button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
   
    @objc func didTapButton(){
        apiManager.fetchFrase { result in
            switch result {
            case .success(let frase):
                frase.exibir() // Exibe a frase recebida da API
            case .failure(let error):
                print("Erro ao obter a frase da API: \(error.localizedDescription)")
            }
        }
    }
}

