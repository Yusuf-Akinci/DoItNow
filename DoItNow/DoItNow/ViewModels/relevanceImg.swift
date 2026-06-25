//
//  relevanceImg.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 24.06.26.
//
import SwiftUI
struct relevanceImg{
    public static func lvlImg(item: Item)->ImageResource{
        if(item.taskDifficulty == .low) {return ImageResource(name: "easy", bundle: .main)}
        if(item.taskDifficulty == .medium) {return ImageResource(name: "medium", bundle: .main)}
        if(item.taskDifficulty == .high) {return ImageResource(name: "hard", bundle: .main)}
        return ImageResource(name: "easy", bundle: .main)
    }
}
