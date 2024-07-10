//
//  PrincipalView.swift
//  KanyeRest
//
//  Created by Victor Levenetz Mariano on 27/03/24.
//

import Foundation
import UIKit


class PrincipalView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    init() {
        // Chamamos um método da UIView para inicialização
        super.init(frame: .zero)
    }

    // O método a seguir é obrigatório na classe UIView
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(labelText: String, buttonTitle: String) {
        label.text = labelText
        button.setTitle(buttonTitle, for: .normal)
    }
}
