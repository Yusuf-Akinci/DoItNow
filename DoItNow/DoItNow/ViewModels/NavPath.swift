//
//  NavPath.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 24.06.26.
//
import SwiftUI

enum NavPath: Hashable{
    case newItem
    case details (Item) // we are passing an item into only the details case
    
}
