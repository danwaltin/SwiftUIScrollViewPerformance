//
//  Mix.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct Mix: Identifiable {
	let id: Int
	let tracks: [Track]
}

extension Mix {
	var width: Double {
		(tracks.last?.displayPosition ?? 0) + (tracks.last?.displayWidth ?? 0)
	}
}
