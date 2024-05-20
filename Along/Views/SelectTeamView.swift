//
//  SelectTeamView.swift
//  MagneTeam
//
//  Created by Alfonso Tarallo on 21/10/23.
//

import SwiftUI
import SwiftData

struct SelectTeamView: View {
    @Environment(\.modelContext) var context
    @Query var teams: [Team] = []
    @State var isCreatingNewTeam: Bool = false
    @State private var selectedTeamIndex: Int?
    
    
    var body: some View {
        NavigationStack {
            
            if (teams.isEmpty) {
                VStack(alignment: .center) {
                    Spacer()
                    
                    Image(systemName: "person.3.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.grigione)
                        .padding()
                    
                    Text("No teams found!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                    Text("To create a new team click on the plus button.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .foregroundStyle(.grigione)
                    
                    Button(action: {
                        isCreatingNewTeam.toggle()
                    }) {
                        Label("Create Team", systemImage: "plus.circle")
                            .padding()
                    }
                }
            }
            
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        Spacer()
                        
                        //                        ForEach(teamViewModel.teams) { team in
                        //
                        //                            TeamCardView(isSelected: team.$isSelected, team: team)
                        //                                .onTapGesture {
                        //                                    withAnimation(.snappy) {
                        //                                        teamViewModel.selectTeam(teamToSelect: team)
                        //                                        print(team.isSelected)
                        //                                    }
                        //                                }
                        //
                        //                        }
                        
                        
                        ForEach(0..<teams.count, id: \.self) { index in
                            TeamCardView(team: teams[index], isSelected: index == selectedTeamIndex)
                                .onTapGesture {
                                    withAnimation(.snappy(duration: 0.1)) {
                                        if selectedTeamIndex == index {
                                            selectedTeamIndex = nil // Deselect if already selected
                                        } else {
                                            selectedTeamIndex = index
                                        }
                                    }
                                }
                                .onLongPressGesture {
                                    context.delete(teams[index])
                                }
                        }
                        
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
                .navigationTitle("Select a team!")
                .toolbar(content: {
                    Button(action: {
                        isCreatingNewTeam.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                })
                
                VStack {
                    Spacer()
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 100)
                        .foregroundColor(CustomColor.grigino)
                        .opacity(1.0)
                        .background(.thickMaterial)
                        .mask({
                            LinearGradient(gradient: Gradient(colors: [.clear, CustomColor.grigino.opacity(0.7), CustomColor.grigino]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                                .frame(height: 100)
                        })
                        .allowsHitTesting(false)
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: {
                        GameView(playingTeamIndex: selectedTeamIndex ?? 0).hideBackButton()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(selectedTeamIndex == nil ? CustomColor.grigione : CustomColor.greenish)
                                .frame(width: 160, height: 50)
                                .shadow(color: CustomColor.greenish.opacity(selectedTeamIndex == nil ? 0.0 : 0.5), radius: 10.0, x: 0, y: 5.0)
                            Text("Start")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.title3)
                        }.opacity(selectedTeamIndex == nil ? 0.7 : 1.0)
                    }).disabled(selectedTeamIndex == nil)
                }
                
            }
            
            
        }
        .background(content: {
            CustomColor.grigino
                .ignoresSafeArea(edges: .all)
        })
        .accentColor(CustomColor.purplish)
        .sheet(isPresented: $isCreatingNewTeam) {
            CreateTeamView(isCreatingNewTeam: $isCreatingNewTeam)
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    SelectTeamView()
}
