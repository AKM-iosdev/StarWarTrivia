//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/25/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import Foundation
import Alamofire

class PersonApi {
    
    // MARK: Web requests using AlamorFire and Codable
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.value {
                debugPrint(error)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    
    // MARK: Web requests using AlamoFire
    func getPersonApiAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        AF.request(url).responseJSON { (response) in
        switch response.result {
            case let .success(value):
                print(value)
                guard let json = response.value as? [String: Any] else { return
                    completion(nil)}
                    let person = self.parsePersonManual(json: json)
                    completion(person)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    // MARK: Web requests using URL Session
 /*   func getPersonApiURLSession(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            }catch {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    } */
    
    
    // Parsing using Manual methods
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
    
}
