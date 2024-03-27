//
//  ViewCode.swift
//  KanyeRest
//
//  Created by Victor Levenetz Mariano on 27/03/24.
//

import Foundation

protocol ViewCode {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewCode {
    func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
}
