//
//  HomeWorldApi.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/27/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import Foundation
import Alamofire

class HomeWorldApi {
    
    func getHomeWorld(url: String, completion: @escaping HomeworldResponseCompletion) {
        guard let url = URL(string: url) else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.value {
                debugPrint(error)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
