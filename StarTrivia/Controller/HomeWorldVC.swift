//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/27/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let api = HomeWorldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeWorld(url: person.homeworldUrl) { (homeworld) in
//        api.getHomeWorld(url: HOMEWORLD_URL) { (homeworld) in
            if let homeworld = homeworld {
                self.configureUI(homeworld: homeworld) //configureUI(homeworld: homeworld)
            }
        }
    }
    
    func configureUI(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }

}
