//
//  Products.swift
//  buscaNativaElo7
//
//  Created by shu on 10/12/20.
//

import Foundation

struct price: Decodable {
    let current: String
    let installment: String
}

struct products: Decodable {
    let _link: String
    let id: Int
    let picture: String
    let price: String
    let title: String
}


