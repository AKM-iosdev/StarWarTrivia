//
//  Constants.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/20/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import UIKit


let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"
let HOMEWORLD_URL = URL_BASE + "planets/1/"
typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
