//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Jessi Zimmerman on 10/31/22.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
                   Double(lengthInMinutes)
               }
        set {
                    lengthInMinutes = Int(newValue)
                }
        }
    var theme: Theme
    var history: [History] = []
    let id: UUID
    
    init(title: String, attendees: [String], lengthInMinutes: Int, theme: Theme, id: UUID = UUID()) {
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        self.id = id
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        var name: String
        let id: UUID
        
        init(name: String, id: UUID = UUID()) {
            self.name = name
            self.id = id
            
        }
    }
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 1
        var theme: Theme = .seafoam
    }
    var data : Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .bubblegum),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gary", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .seafoam),
        DailyScrum(title: "Web Dev", attendees: ["Chella","Chris","Christina","Eden","Karla","Lindsey","Aga","Chad","Jenn","Sarah"], lengthInMinutes: 5, theme: .lavender)
    ]
}
