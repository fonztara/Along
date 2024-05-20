//
//  GameView.swift
//  MagneTeam
//
//  Created by Alfonso Tarallo on 26/10/23.
import SwiftUI
import SwiftData

struct GameView: View {
    @Query var teams: [Team] = []
    var playingTeamIndex: Int
    @State private var playingTeam: Team?
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentQuestion = 1
    @State private var remainingQuestions = 5
    @State private var score = 0
    @State private var showAlert = false
    @State private var navigateBack = false
    @State private var activities = sampleActivities
    @State private var gameEnded = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .offset(CGSize(width: 0, height: -200))
                    .union(.circle.inset(by: -70))
                    .fill(CustomColor.greenish)
                
                VStack {
                    HStack {
                        Button("Quit") {
                            showAlert = true
                        }
                        .foregroundColor(.red)
                        
                        Spacer()
                        
                        HStack {
                            Text("\(teams[playingTeamIndex].name)")
                                .font(.title3)
                                .bold()
                        }
                        .foregroundColor(colorScheme == .light ? .white : .black)
                    }
                    .padding()
                    
                    HStack {
                        Text(activities[currentQuestion - 1].category)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(colorScheme == .light ? .white : .black)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        Text("\(currentQuestion)/\(remainingQuestions)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(colorScheme == .light ? .white : .black)
                        
                        ZStack {
                            Text("+ \(activities[currentQuestion - 1].points) pt")
                                .font(.headline)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundColor(.white)
                                )
                                .foregroundColor(.black)
                                .padding(.horizontal, 8)
                        }
                    }.padding(.top, 64)
                    
                    Text(activities[currentQuestion - 1].description)
                        .font(.title2)
                        .padding()
//                        .padding(.top, 8)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(CustomColor.purplish)
                        .padding(.trailing, 32)
                    Spacer()
                    
                    NavigationLink("", destination: EndedGameView(playingTeamIndex: playingTeamIndex, score: score, team: playingTeam ?? teams[0]).hideBackButton(), isActive: $gameEnded)
                        .hidden()
                    Button("Next") {
                        if currentQuestion < remainingQuestions {
                            currentQuestion += 1
                            score += activities[currentQuestion - 1].points
                        } else {
                            gameEnded = true
                        }
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(CustomColor.greenish)
                            .frame(width: 500, height: 500)
                            .offset(x: 0, y: 220)
                            .onTapGesture {
                                if currentQuestion < remainingQuestions {
                                    currentQuestion += 1
                                    score += activities[currentQuestion - 1].points
                                } else {
                                    gameEnded = true
                                }
                            }
                    )
                }.padding()
                
            }
            .onAppear() {
                playingTeam = teams[playingTeamIndex]
            }
        }
        .navigationBarItems(trailing: NavigationLink(
            destination: HomeView().hideBackButton(),
            isActive: $navigateBack) {
                EmptyView()
            })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Quit Game"),
                message: Text("Are you sure you want to quit the game?"),
                primaryButton: .default(Text("Confirm")) {
                    navigateBack = true
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    GameView(playingTeamIndex: 0)
}



struct HideBackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
    }
}
extension View {
    func hideBackButton() -> some View {
        modifier(HideBackButton())
    }
}
