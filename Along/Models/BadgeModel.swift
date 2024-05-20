//
//  BadgeModel.swift
//  TubaraoApp
//
//  Created by Alfonso Tarallo on 18/10/23.
//

import Foundation
import SwiftUI
import SwiftData



@Model
class Badge: Identifiable {
    var id = UUID()
    var title: String
    var obtained: Bool = false
    
    init(id: UUID = UUID(), title: String, obtained: Bool = false) {
        self.id = id
        self.title = title
        self.obtained = obtained
    }
}
