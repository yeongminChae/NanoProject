//
//  NanoProjectApp.swift
//  NanoProject
//
//  Created by 채영민 on 2023/05/30.
//

import SwiftUI

@main
struct NanoProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SelectedMovie2())
        }
    }
}
