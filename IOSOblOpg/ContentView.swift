//
//  ContentView.swift
//  IOSOblOpg
//
//  Created by dmu mac 20 on 10/11/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: EarthVM
    //@State var earthquakes: [EarthQuake]
    
    
    var body: some View {
        TabView { AllEarth(earthenum: .Hour)
                .tabItem { Label("Hour", systemImage: "list.dash")
                }
            AllEarth(earthenum: .Day)
                .tabItem {
                    Label("Day", systemImage: "list.dash")
                }
            AllEarth(earthenum: .Week)
                .tabItem {
                    Label("Week", systemImage: "list.dash")
                }
            
            AllEarth(earthenum: .Month)
                .tabItem {
                    Label("Month", systemImage: "list.dash")
                }
                
                
                
            }
        .foregroundColor(.primary)
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EarthVM(service: NetworkService()))
    }
}
