//
//  ToDo.swift
//  DemoAlzyCare
//
//  Created by Rishita kumari on 09/06/24.
//

import Foundation

struct ToDo:Equatable, Codable{
    var id = UUID()
    var title:String
    var iscomplte:Bool
    var dueDate:Date
    var notes:String?
    
    init(title: String, iscomplte: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.iscomplte = iscomplte
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func == (lhs: ToDo,rhs: ToDo) -> Bool{
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    
    static func loadSampleToDos() -> [ToDo] {
        let ToDo1 = ToDo(title: "ToDo1", iscomplte: false, dueDate: Date(), notes: "Notes 1")
        let ToDo2 = ToDo(title: "ToDo2", iscomplte: false, dueDate: Date(), notes: "Notes 2")
        let ToDo3 = ToDo(title: "ToDo3", iscomplte: false, dueDate: Date(), notes: "Notes 3")
        
        return[ToDo1,ToDo2,ToDo3]
    }
    static func saveToDos(_ toDos: [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    static let dueDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter
        }()
}

