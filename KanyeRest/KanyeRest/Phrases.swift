//
//  Phrases.swift
//  KanyeRest
//
//  Created by Victor Levenetz Mariano on 16/06/24.
//

import Foundation


class Phrases: Codable{
    var quotes: String
       
       init(quotes: String) {
           self.quotes = quotes
       }
       
       func exibir() {
           print("Frase: \(quotes)")
       }

}
