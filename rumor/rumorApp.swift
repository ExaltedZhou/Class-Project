//
//  rumorApp.swift
//  rumor
//
//  Created by Albert Zhou on 11/19/23.
//

import SwiftUI
import SwiftData

@main
struct rumorApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PostViewModel())
        }
    }
}
/*
Image(systImage(systemName: "arrowshape.turn.up.forward.circle.fill")emName: "arrowshape.turn.up.right.circle.fill")
*/
