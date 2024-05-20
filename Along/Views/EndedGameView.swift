//
//  EndedGameView.swift
//  MagneTeam
//
//  Created by Benedetta Beatrice on 28/10/23.
//

import SwiftUI
import SwiftData

struct EndedGameView: View {
    @Environment(\.modelContext) var context
    @Query var teams: [Team] = []
    var playingTeamIndex: Int
    var score: Int
    @Bindable var team: Team
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .offset(CGSize(width: 0, height: -200))
                    .union(.circle.inset(by: -70))
                    .fill(CustomColor.greenish)
                VStack(spacing: 16) {
                    HStack {
                        Text("Great Job! 🎊")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.purplish)
                            .padding(.leading, 16)
                        Spacer()
                    }
                    
                    Text("You completed your first set of activities and questions, celebrate together with your team mates!")
                        .font(.title2)
                        .foregroundColor(colorScheme == .light ? .white : .black)
                    
                    Spacer()
                }
                .padding()
                .padding(.top, 192)
                
                VStack {
                    Spacer()
                    NavigationLink(destination: HomeView().hideBackButton) {
                        Text("HomePage")
                            .font(.system(size: 20))
                            .foregroundColor(.primary)
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(CustomColor.greenish)
                            .frame(width: 500, height: 500)
                            .offset(x: 0, y: 200)
                            .onTapGesture {
                                
                            }
                    )
                }
                .navigationBarHidden(true) // non lo so se mi piace sto coso volevo solo capire poi da qua che si fa
            }
           
        }
        .onAppear() {
            team.points += score
            let badgeToObtain: Int = team.points / 50
            for index in 0..<team.badges.count {
                if(index <= badgeToObtain - 1) {
                    team.badges[index].obtained = true
                }
            }
        }
    }
}

struct EndedGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndedGameView(playingTeamIndex: 0, score: 0, team: Team(name: "", motto: "", members: []))
    }
}

