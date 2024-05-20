//
//  MemberModel.swift
//  TubaraoApp
//
//  Created by Alfonso Tarallo on 17/10/23.
//

import Foundation
import SwiftUI
import SwiftData



@Model
class Member: Identifiable {
    var id = UUID()
    
    var name: String = "Name"
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
