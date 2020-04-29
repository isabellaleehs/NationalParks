//
//  ParkService.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import Foundation

enum ParkCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class ParkService {
    private let urlString = "http://www.mocky.io/v2/5ea8f8ac2d000097883a41e2"
    
    func getParks(completion: @escaping ([Park]?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                DispatchQueue.main.async { completion(nil, ParkCallingError.problemGeneratingURL) }
                return
        }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async { completion(nil, ParkCallingError.problemGettingDataFromAPI) }
                    return
                }
                
                do {
                    let parkResult = try JSONDecoder().decode(ParkResult.self, from: data)
                    DispatchQueue.main.async { completion(parkResult.parks, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, ParkCallingError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }
}
