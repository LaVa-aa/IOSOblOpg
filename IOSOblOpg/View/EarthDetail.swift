//
//  EarthDetail.swift
//  IOSOblOpg
//

import SwiftUI


struct EarthDetail: View {
    var earthQuake: EarthQuake
 //@EnvironmentObject var vm: EarthVM
 
 var body: some View {
     HStack{
     Image(systemName: "globe.europe.africa.fill")
             .font(.system(size: 20.0))
         Text(String(earthQuake.properties.mag.formatted()))
         VStack{
         Text(earthQuake.properties.time.formatted(.dateTime.weekday().day().month().year().hour().minute()))
             Text(earthQuake.properties.title)
         }
         
     }
     
 
 }
 }
 
 
 struct EarthDetail_Previews: PreviewProvider {
 static var previews: some View {
     
     let propeteies = EarthQuake.Properties(mag: 12.8, place: "place", time: Date(), url: "https://url/1", detail: "https://detail", title: "title")
         
         let coordinates = [
             -117.8466667,
             36.081,
             0.77
             ]
         
         let geo = EarthQuake.Geometry(coordinates: coordinates)
     EarthDetail(earthQuake: EarthQuake(properties: propeteies, geometry: geo))
 }
 }
 
