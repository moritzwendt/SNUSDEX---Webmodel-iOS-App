//
//  Item.swift
//  SDX webmodel
//
//  Created by Moritz Wendt on 27.03.26.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}
