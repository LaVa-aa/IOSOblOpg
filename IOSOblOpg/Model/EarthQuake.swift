//
//  EarthQuake.swift
//  IOSOblOpg
//

//

import Foundation

struct Result: Codable{
    let features: [EarthQuake]
    
    
}

public struct EarthQuake: Codable, Identifiable{
    public let id = UUID().uuidString
    let properties: Properties
    let geometry: Geometry
    
    struct Properties: Codable{
        let mag: Double
        let place: String
        let time: Date
        //let type: String
        //let status: String
        //let updated: Int64
        //let tz: Int
        let url: String
        let detail: String
        let title: String
        //let felt: Int
        //let cdi: Double
        //let mmi: Double
        //let alert: String
    
        //let tsunami: Int
        //let sig: Int
        //let net: String
        //let code: String
        //let ids: String
        //let sources: String
        //let types: String
        //let nst: Int
        //let dmin: Double
        //let rms: Double
        //let gap: Double
        //let magType: String
        
    }
  
    
    struct Geometry: Codable{
        let coordinates: [Double]
        //let id = UUID().uuidString
        }
    }





