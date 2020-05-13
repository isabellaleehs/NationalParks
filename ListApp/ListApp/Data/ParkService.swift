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
    case problemArrayEmpty
    case problemInternetDisconnected
}

extension ParkCallingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .problemArrayEmpty:
            return NSLocalizedString(
                "The list is empty. Don't worry, the app didn't crash!",
                comment: ""
            )
        case .problemInternetDisconnected:
            return NSLocalizedString(
                "You are disconnected from the Internet. Connect to a network to display information.",
                comment: ""
            )
        default:
            return NSLocalizedString(
                "Something went wrong.",
                comment: ""
            )
        }
    }
}

class ParkService {
    private let urlString = "http://www.mocky.io/v2/5ea8f8ac2d000097883a41e2" //actual data
//    private let urlString = "http://www.mocky.io/v2/5ebbf5f82e00004b009f4071" //empty
    let reachability: Reachability = Reachability()
    
    func getParks(completion: @escaping ([Park]?, Error?) -> ()) {
            guard reachability.isConnectedToNetwork() else {
                print("Internet connection not available.")
                DispatchQueue.main.async { completion(nil, ParkCallingError.problemInternetDisconnected) }
                return
            }
        
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
                
                guard data.count > 2 else {
                    DispatchQueue.main.async { completion(nil, ParkCallingError.problemArrayEmpty) }
                    return
                }
                                
                do {
                    let parkResult = try JSONDecoder().decode(ParkResult.self, from: data)
                    guard parkResult.parks.count > 0 else {
                        DispatchQueue.main.async {
                            completion(nil, ParkCallingError.problemArrayEmpty)
                        }
                        return
                    }
                    DispatchQueue.main.async { completion(parkResult.parks, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, ParkCallingError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }
}
