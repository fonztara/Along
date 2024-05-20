//
//  TeamCardView.swift
//  MagneTeam
//
//  Created by Benedetta Beatrice on 25/10/23.
//

import SwiftUI

struct TeamCardView: View {
    @Environment(\.colorScheme) var colorScheme
    var team: Team
    var isSelected: Bool
    
    var body: some View {
        
        VStack {
            
            //                if (!isExpanded) {
            //                    Spacer()
            //                }
            
            HStack {
                Image("\(team.picture)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                
                VStack(alignment: .leading) {
                    
                    Text("\(team.name)")
                        .font(.title)
                        .bold()
                    
//                    Text("\(team.motto)")
//                        .font(.subheadline)
//                    
//                    Text("\(team.points) pt")
                    
                }
                
                Spacer()
                
                Image(systemName: "\(isSelected ? "chevron.up" : "chevron.down")")
                    .padding()
                    .foregroundColor(CustomColor.purplish)
                
            }.foregroundColor(.black)
            //                .padding(.vertical, isExpanded ? 15 : 0)
            
            if(isSelected) {
                VStack {
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(team.members) { member in
                                Text("\(member.name)")
                                
//                                \(member.surname)
                                    .foregroundStyle(.black)
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    HStack {
                        Text("Team Badges")
                            .bold()
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top, 16)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(team.badges) { badge in
                                ZStack {
                                    Circle()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(badge.obtained ? CustomColor.purplish : CustomColor.grigino)
                                        .opacity(0.5)
                                        .padding(.horizontal, 10)
                                        .offset(x: -5, y: -3)
                                    Circle()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(badge.obtained ? CustomColor.purplish : CustomColor.grigino)
                                        .opacity(0.5)
                                        .padding(.horizontal, 10)
                                        .offset(x: 5, y: 3)
                                    Text("\(badge.title)")
                                        .frame(width: 50, height: 50)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 8))
//                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    .scrollIndicators(.hidden)
                    
                }
            }
            
            
            Spacer()
            
        }
        //        .frame(height: isExpanded ? 300 : 140)
        .background(content: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
        })
        
        .opacity(isSelected ? 1.0 : 0.6)
    }
}

#Preview {
    //    TeamCardView(team: Team())
    SelectTeamView()
}
