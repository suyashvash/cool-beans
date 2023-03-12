//
//  FileManager-DocumentsDirectory.swift
//  coolBeans
//
//  Created by Suyash Vashishtha on 12/03/23.
//

import Foundation


extension FileManager{
    static var documentDirectory:URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
