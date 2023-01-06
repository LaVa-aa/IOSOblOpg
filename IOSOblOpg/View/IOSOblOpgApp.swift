//
//  IOSOblOpgApp.swift
//  IOSOblOpg
//
//  Created by dmu mac 20 on 10/11/2022.
//

import SwiftUI

@main
struct IOSOblOpgApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(EarthVM(service: NetworkService()))
        }
    }
}
