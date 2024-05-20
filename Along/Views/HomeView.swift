//
//  HomeView.swift
//  MagneTeam
//
//  Created by Alfonso Tarallo on 20/10/23.
//

import SwiftUI



struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isInfoShown: Bool = false
    
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isInfoShown.toggle()
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .padding()
                    .foregroundColor(CustomColor.purplish)
                    .font(.title2)
                }
                
                Spacer()
                
                
                NavigationLink {
                    SelectTeamView()
                } label: {
                    
                    CirclesView()
                    
                }
                
                
                Spacer()
                
                Text("Game app for team building")
                    .padding(50)
            }
            .sheet(isPresented: $isInfoShown){
                InfoSheetView(isInfoShown: $isInfoShown)
                //                    .presentationCompactAdaptation(.fullScreenCover)
                    .presentationDragIndicator(.visible)
                    .presentationBackground(.regularMaterial)
            }
        }.accentColor(CustomColor.purplish)
    }
}


#Preview {
    HomeView()
}


struct CirclesView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var rotationAngle: Double = 0.0
    
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundColor(CustomColor.purplish)
                .frame(width: 300)
                .opacity(0.7)
                .offset(x: -10.0, y: -10.0)
                .rotationEffect(.degrees(rotationAngle))
            
            Circle()
                .foregroundColor(CustomColor.purplish)
                .frame(width: 280)
                .opacity(0.7)
                .offset(x: 15.0, y: 10.0)
                .rotationEffect(.degrees(-rotationAngle))
            
            Text("select team")
                .font(.largeTitle)
                .bold()
                .frame(width: 150)
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? .white : .black)
        }
        .onAppear() {
            animateCircles()
        }
    }
    
    
    func animateCircles() {
            DispatchQueue.global(qos: .background).async {
                while true {
                    withAnimation(.linear(duration: 10.0).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                    Thread.sleep(forTimeInterval: 1.0)
                }
            }
        }
    
}



