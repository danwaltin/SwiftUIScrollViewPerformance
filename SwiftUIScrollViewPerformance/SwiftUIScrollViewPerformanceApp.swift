//
//  SwiftUIScrollViewPerformanceApp.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

@main
struct SwiftUIScrollViewPerformanceApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(mix: mix)
        }
    }
}

let tracks = [
	Track(id: 0, title: "Dancing Queen",                  displayPosition: 0,    displayWidth: 200),
	Track(id: 1, title: "Bjekkergauken",                  displayPosition: 190,  displayWidth: 300),
	Track(id: 2, title: "Animals",                        displayPosition: 480,  displayWidth: 100),
	Track(id: 3, title: "Always Look On the Bright Side", displayPosition: 570,  displayWidth: 250),
	Track(id: 4, title: "Längtan till landet",            displayPosition: 790,  displayWidth: 220),
	Track(id: 5, title: "Söndermarken",                   displayPosition: 1000, displayWidth: 200),
	Track(id: 6, title: "Happyland",                      displayPosition: 1200, displayWidth: 300),
	Track(id: 7, title: "How Much Is the Fish",           displayPosition: 1500, displayWidth: 75),
	Track(id: 8, title: "Boom Boom Ba",                   displayPosition: 1520, displayWidth: 100)
]

let mix = Mix(id: 100, tracks: tracks)
