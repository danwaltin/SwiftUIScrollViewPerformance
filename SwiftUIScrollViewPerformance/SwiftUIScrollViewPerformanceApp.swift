//
//  SwiftUIScrollViewPerformanceApp.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

@main
struct SwiftUIScrollViewPerformanceApp: App {
	let settings = Settings()
	
    var body: some Scene {
        WindowGroup {
			ContentView(settings: settings)
        }
    }
}
