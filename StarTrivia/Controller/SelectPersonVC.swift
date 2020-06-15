//
//  ViewController.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 5/26/19.
//  Copyright © 2019 Arun Kumar Mora. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeWorldBtn: UIButton!
    @IBOutlet weak var vehicleBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func randomBtnClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        personApi.getPersonApiAlamo(id: random) { (person) in
            if let person = person {
                self.setUpView(person: person)
                self.person = person
            }
        }
    }
    
    func setUpView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehicleBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeWorld" {
            if let destination = segue.destination as? HomeWorldVC {
                destination.person = person
            }
        } else if segue.identifier == "toVehicles" {
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
        } else if segue.identifier == "toStarShips" {
            if let destination = segue.destination as? StarshipsVC {
                destination.person = person
            }
        } else {
            if let destination = segue.destination as? FilmsVC {
                destination.person = person
            }
        }
    }
}

