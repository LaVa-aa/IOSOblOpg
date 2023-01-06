//
//  AllEarth.swift
//  IOSOblOpg
//
//  Created by dmu mac 20 on 14/11/2022.
//

import SwiftUI
// her vil jeg gerne implementer all earth
//hvor der skal vises en list af Earthquake bassert på de 4 endpoints
struct AllEarth: View {
    // for at får fat i disse endpointer i EQEnum
    var earthenum: EQEnum
    //ved bruge af enviromentObject gør det nemmer
    //for at dele med views
    @EnvironmentObject var vm: EarthVM
    var body: some View {
        NavigationView{
            List(vm.earthQuakes){earth in
            
                NavigationLink(destination: PinAnnotationMapView(lat:earth.geometry.coordinates[1], lon: earth.geometry.coordinates[0])){
                            EarthDetail(earthQuake: earth)
            }
                .listRowBackground(Color.pink)
                .listStyle(.inset)
                .listRowSeparatorTint(Color.black)
                //.listRowSeparator(<#T##visibility: Visibility##Visibility#>)
                
        
    }
            
            .navigationTitle("EARTHQUAKE \(String(describing: earthenum).uppercased())")
           
        }
        
        
        //her bruge jeg VM og får fat på metoden
        //load() som får fat på url af api
        .task {
            await vm.load(earthquakeSpan: earthenum)
        }
        
    }
    
    
}

struct AllEarth_Previews: PreviewProvider {
    static var previews: some View {
        AllEarth(earthenum: .Day).environmentObject(EarthVM(service: NetworkService()))
    }
}
