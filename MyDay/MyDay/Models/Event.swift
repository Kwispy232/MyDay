//
//  Event.swift
//  MyDay
//
//  Created by Sebastian Mraz on 30/03/2024.
//

import Foundation

struct Event: Codable {
    
    let title: String
    let durationInMinutes: Int
    let startTime: Date
    let description: String
    let icon: String
    let isDone: Bool
    
    var duration: String {
        return  ""
    }
    
    static let mock: Self = Event(
        title: "title",
        durationInMinutes: 30,
        startTime: .now,
        description: "description",
        icon: "perspective",
        isDone: false
    )
    
}
