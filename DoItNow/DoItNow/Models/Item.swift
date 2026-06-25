//
//  User.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 23.06.26.
//

import Foundation

struct Item: Identifiable, Equatable, Hashable{
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var taskDifficulty: TaskDifficulty
    
    
}

enum Status: String{
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    case unknown = "Unknown"
    
    init(_ str: String) { //_ bedeutet: Argument label ist nicht vorgeschrieben: -> let status = Status("done") und nicht Status(str: "done")
        self = switch str.lowercased(){ //egal wie sie geschrieben sind, es wird klein-geschrieben wahrgenommen
        case "todo": .todo
        case "inprogress": .inProgress
        case "done": .done
        default: .unknown
        }
    }
}

enum TaskDifficulty: String{
    case low = "Easy"
    case medium = "Medium"
    case high = "Hard"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased(){
        case "low": .low
        case "medium": .medium
        case "high": .high
        default: .unknown
        }
    }
}
