//
//  Launch.swift
//  MassNotes
//
//  Created by Sherif Yasser on 31.07.22.
//

import SwiftUI

struct Launch: View {
    @FetchRequest(sortDescriptors: []) var appState : FetchedResults<AppState>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        if appState.count != 0{
            if(appState[0].isIntro){
                Intro()
            }
            else{
                MuscleGroupsPerDay()
            }
        }
        else{
            Intro()
        }
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
