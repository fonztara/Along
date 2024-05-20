//
//  CreateTeamView.swift
//  MagneTeam
//
//  Created by Alfonso Tarallo on 23/10/23.
//



import SwiftUI


struct CreateTeamView: View {
    @Environment(\.modelContext) var context
    @Binding var isCreatingNewTeam: Bool
    @State  var teamName = ""
    @State  var memberName = ""
    @State  var members: [Member] = []
    
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("New Team")) {
                    TextField("Team Name", text: $teamName)
                }
                
                Section(header: Text("Team Members")) {
                    List {
                        ForEach(members) { member in
                            Text("\(member.name)")
                        }
                    }
                    TextField("Member Name", text: $memberName)
                    Button("Add Member") {
                        if !memberName.isEmpty {
                            members.append(Member(name: memberName))
                            memberName = ""
                        }
                    }
                    
                }
            }
            .navigationTitle("New Team")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        isCreatingNewTeam.toggle()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // how to create a new team where do we go
                        let newTeam = Team(name: teamName, motto: "Ce magnamm", members: members)
                        context.insert(newTeam)
                        // dismiss the sheet
                        isCreatingNewTeam.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    SelectTeamView(isCreatingNewTeam: true)
}



