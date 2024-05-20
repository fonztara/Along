//
//  InfoSheetView.swift
//  MagneTeam
//
//  Created by Alfonso Tarallo on 20/10/23.
//

import SwiftUI

struct InfoSheetView: View {
    @Binding var isInfoShown: Bool
    
    var body: some View {
        VStack {
            
            
            HStack {
                Spacer()
                Button(action: {
                    isInfoShown.toggle()
                }){
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        Text("Guidebook")
                            .font(.title)
                            .bold()
                            .padding(.vertical, 30)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Team Creation").font(.title3).bold()
                        Text("Start by creating a team and entering the name of the group and the names of the participants.")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Starting the game").font(.title3).bold()
                        Text("Once you are ready, select the team and Start the game.")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Questions & Scoring").font(.title3).bold()
                        Text("In each session, you will receive 5 questions or activities. Each time you answer a question, you will earn points.")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Results & Badges").font(.title3).bold()
                        Text("At the end of each session, you will be able to view the results on the team screen and earn \"Insight into Knowledge\" badges based on your progress.")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Have fun").font(.title3).bold()
                        Text("The game is designed to be fun while fostering knowledge and interaction among your team members.")
                    }
                }.padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
        }
        .padding()
    }
}

#Preview {
    InfoSheetView(isInfoShown: .constant(true))
}
