//
//  Serving.swift
//  coolBeans
//
//  Created by Suyash Vashishtha on 12/03/23.
//

import Foundation

struct Serving : Identifiable,Codable,Equatable{
    var id :UUID
    let name:String
    let description:String
    let caffeine: Int
    let calories: Int
    let image:String
    
    
}
