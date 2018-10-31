//
//  Drawing.swift
//  TouchTracker
//
//  Created by Emil Villefrance on 31/10/2018.
//  Copyright © 2018 Jacob Nielsen. All rights reserved.
//

import Foundation

struct Drawing: Codable {
    var lines: [Line]
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(Drawing.self, from: json) {
            self = newValue
            print("initiliazed drawing succesfully from json")
        } else {
            print("failed initilization of drawing from json")
            return nil
        }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init(lines: [Line]) {
        self.lines = lines
    }
}
