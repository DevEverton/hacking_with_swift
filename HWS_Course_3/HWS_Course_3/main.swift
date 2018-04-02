//
//  main.swift
//  HWS_Course_3
//
//  Created by Everton Carneiro on 02/04/2018.
//  Copyright © 2018 Everton. All rights reserved.
//

import Foundation


//Challenge 27 - Print last lines of a file reversed

func challenge27(fileName: String, lineCount: Int) {
    guard let input = try? String(contentsOfFile: fileName) else { return }
    var lines = input.components(separatedBy: "\n")
    guard lines.count > 0 else { return }
    lines.reverse()
    
    for i in 0..<min(lines.count, lineCount) {
        print(lines[i])
    }
   
}


challenge27(fileName: "sample.txt", lineCount: 100)


//Challenge 28 - Log a message


func challenge28(log message: String, to logFile: String) {
    var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
    
    existingLog.append("\(Date()): \(message)\n")
    
    do {
        try existingLog.write(toFile: logFile, atomically: true,
                              encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}

challenge28(log: "Random log message", to: "mYlogFile")
challenge28(log: "New message on myLogFile", to: "mYlogFile")

//Challenge 29 - Documents directory

func challenge29() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
    return paths[0]
}


