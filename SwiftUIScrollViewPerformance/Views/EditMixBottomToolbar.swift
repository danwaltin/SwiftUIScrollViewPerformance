//
//  EditMixBottomToolbar.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct EditMixBottomToolbar: View {
	let numberOfTracks: Int
	let duration: TimeInterval
	
	var body: some View {
		HStack {
			Text("Number of tracks: \(numberOfTracks)")
				.padding()
			Text("Duration:  \(duration.asDurationString())")
			Spacer()
		}
	}
}
