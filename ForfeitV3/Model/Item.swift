//
//  Item.swift
//  ForfeitV3
//
//  Created by Josh Mitchell on 9/23/20.
//  Copyright © 2020 Ava Ford. All rights reserved.
//

import Foundation

class Item: Codable {
    var title: String = ""
    var evidence: Bool = false
    var done: Bool = false
    
    var date: String = ""
    var amount: Int = -1
}
