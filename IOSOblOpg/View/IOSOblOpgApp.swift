//
//  IOSOblOpgApp.swift
//  IOSOblOpg
//
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
