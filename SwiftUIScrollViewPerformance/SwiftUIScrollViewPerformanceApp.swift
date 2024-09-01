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
	Track(id: 0, title: "Dancing Queen",                  displayPosition: 0,    displayWidth: 400),
	Track(id: 1, title: "Bjekkergauken",                  displayPosition: 400,  displayWidth: 600),
	Track(id: 2, title: "Animals",                        displayPosition: 1000, displayWidth: 200),
	Track(id: 3, title: "Always Look On the Bright Side", displayPosition: 1200, displayWidth: 500),
	Track(id: 4, title: "Längtan till landet",            displayPosition: 1700, displayWidth: 400),
	Track(id: 5, title: "Söndermarken",                   displayPosition: 2100, displayWidth: 400),
	Track(id: 6, title: "Happyland",                      displayPosition: 2500, displayWidth: 600),
	Track(id: 7, title: "How Much Is the Fish",           displayPosition: 3100, displayWidth: 200),
	Track(id: 8, title: "Boom Boom Ba",                   displayPosition: 3300, displayWidth: 200)
]

let mix = Mix(id: 100, tracks: tracks)
