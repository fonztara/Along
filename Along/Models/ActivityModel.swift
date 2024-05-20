//
//  ActivityModel.swift
//  TubaraoApp
//
//  Created by Alfonso Tarallo on 18/10/23.
//

import Foundation
import SwiftUI

struct Activity: Identifiable {
    var id = UUID()
    
    var category: String
    var description: String
    var points: Int
    var time: Int
}

let sampleActivities: [Activity] = [
    Activity(category: "Activity", description: "Team members write anonymous fun facts about themselves, which are then shuffled and distributed to others. Everyone takes turns guessing who wrote each fact, and the authors are revealed after all guesses are made.", points: 10, time: 5),
    Activity(category: "Question", description: "What’s one item on your bucket list, and why is it important to you?", points: 5, time: 10),
    Activity(category: "Question", description: "Share what animal you feel a strong connection to or believe represents your personality. It's a creative way to explore individual characteristics.", points: 15, time: 7),
    Activity(category: "Activity", description: "Ask team members to share what they believe their unique strengths and which would be their superpowers", points: 10, time: 12),
    Activity(category: "Question", description: "What's your favorite way to spend a weekend when you have no work-related commitments?", points: 20, time: 8)
]
