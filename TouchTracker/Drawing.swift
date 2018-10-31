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
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
}
