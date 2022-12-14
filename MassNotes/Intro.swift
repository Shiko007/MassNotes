//
//  ContentView.swift
//  MassNotes
//
//  Created by Sherif Yasser on 31.07.22.
//

import SwiftUI

struct Intro: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var appState : FetchedResults<AppState>
    @State var days : Int = 1
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                HStack{
                    Text("Welcome to Mass Notes").font(.largeTitle).bold().dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding()
                    Spacer()
                }
                Spacer()
                VStack{
                    Spacer()
                    Text("How many days are you planning to exercise").font(.title).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding()
                    Spacer()
                    Text("\(days)").font(.largeTitle).bold().dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding()
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            if(days > 1){
                                days = days - 1
                            }
                        } label: {
                            Text("-").font(.largeTitle).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding()
                        }
                        Spacer()
                        Button {
                            if(days < 7){
                                days = days + 1
                            }
                        }label: {
                            Text("+").font(.largeTitle).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    NavigationLink(destination: MuscleGroupsPerDay()) {
                        Text("Next").font(.title).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/).padding().foregroundColor(.black)
                    }
                    .background(.gray).clipShape(RoundedRectangle(cornerRadius: 10))
                    .simultaneousGesture(TapGesture().onEnded{
                        if appState.count != 0{
                            AppStateHandler().editAppState(appState: appState[0], isIntro: false, context: managedObjectContext)
                        }
                        else{
                            AppStateHandler().addAppState(isIntro: false, context: managedObjectContext)
                        }
                    })
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
