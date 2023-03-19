//
//  LIST.swift
//  Projet4
//
//  Created by Lion on 21/03/2023.
//

import Foundation


struct Present: Identifiable {
    
    var id = UUID()
    var nameOfPresent : String
    var image : String
}
    

var playstation = (Present(nameOfPresent: "Playstation 5", image: "playstation"))
var nas = (Present(nameOfPresent: " Nas ds220 ", image: "nas"))
var earpod = (Present(nameOfPresent: "Earpod 2 pro ", image: "airpod"))
var casqueAirPod = (Present(nameOfPresent: "Casque earpod ", image: "Casque"))
//var earpod = (Present(nameOfPresent: "Earpod 2 pro ", image: "airpod"))


var arrayOfPresent = [playstation,nas,earpod,casqueAirPod]
