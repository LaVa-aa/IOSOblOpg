//
//  EarthVM.swift
//  IOSOblOpg
//
//  Created by dmu mac 20 on 10/11/2022.
//

import Foundation

//her har jeg VM classen som hjælper med at koble vores model med de andre view 
class EarthVM: ObservableObject{
    @Published var earthQuakes: [EarthQuake] = []
    private let service: NetworkService
    
    init(service: NetworkService) {
        
        self.service = service
       
    }
    

    func load(earthquakeSpan: EQEnum) async -> Void{
        Task{
            do{
                self.earthQuakes = try await service.fetchEarthQuake(earthquakeSpan: earthquakeSpan).sorted(by: {$0.properties.mag < $1.properties.mag})
            }catch {
                print("Worning there is error")
            }
        }
    }
}


