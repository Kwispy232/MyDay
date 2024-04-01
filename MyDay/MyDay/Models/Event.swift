//
//  Event.swift
//  MyDay
//
//  Created by Sebastian Mraz on 30/03/2024.
//

import Foundation

struct Event: Identifiable, Codable, Equatable {
    
    var id: String {
        title + startTime.formatted()
    }
    
    let title: String
    let durationInMinutes: Int
    let startTime: Date
    let exactTime: Bool
    let description: String
    let icon: String
    let isDone: Bool
    
    var duration: String {
        if durationInMinutes / 60 < 1 {
            return "\(durationInMinutes)min"
        }
        return "\(durationInMinutes / 60)h"
    }
    
    static func mock(title: String = "title") -> Self {
        Event(
            title: title,
            durationInMinutes: 30,
            startTime: .now,
            exactTime: false,
            description: "description",
            icon: "perspective",
            isDone: false
        )
    }
    
}
