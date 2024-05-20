//
//  TeamModel.swift
//  TubaraoApp
//
//  Created by Alfonso Tarallo on 17/10/23.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class Team: Identifiable {
    var id = UUID()
    var name: String
    var points: Int
    var motto: String
    var picture: String
    var members: [Member]
    var badges: [Badge]
    
    init(id: UUID = UUID(), name: String, points: Int = 0, motto: String, picture: String = "teamPicture", members: [Member], badges: [Badge] = [
        Badge(title: "Not Strangers"),
        Badge(title: "Knowers"),
        Badge(title: "Friendly Colleagues"),
        Badge(title: "Almost Friends"),
        Badge(title: "Good Friends"),
        Badge(title: "Best Friends!")
    ]) {
        self.id = id
        self.name = name
        self.points = points
        self.motto = motto
        self.picture = picture
        self.members = members
        self.badges = badges
    }
}
