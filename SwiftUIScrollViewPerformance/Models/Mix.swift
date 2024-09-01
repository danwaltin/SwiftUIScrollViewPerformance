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
	var duration: TimeInterval {
		tracks.reduce(0, {$0 + $1.length})
	}
}

extension Mix {
	var displayTracks: [TrackDisplayModel] {
		var result = [TrackDisplayModel]()
		
		var accumulatedDuration: TimeInterval = 0
		for track in tracks {
			result.append(.init(
				id: track.id,
				title: track.title,
				displayPosition: accumulatedDuration,
				displayWidth: track.length))
			accumulatedDuration += track.length
		}
		return result
	}
}
