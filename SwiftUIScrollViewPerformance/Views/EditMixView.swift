//
//  EditMixView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct EditMixView : View {
	private let mix: Mix
	private let timelineSections: [TimelineSection]
	private let tracks: [TrackDisplayModel]
	
	init(mix: Mix) {
		self.mix = mix
		tracks = mix.displayTracks
		
		timelineSections = mix.duration
			.timelineSections(resolution: .oneMinute)
	}
	
	var body: some View {
		ScrollView([.vertical, .horizontal]) {
			VStack(spacing: 0) {
				TimelineSectionsView(sections: timelineSections)
					.frame(width: mix.duration, height: 30)
				ForEach(tracks) { track in
					TrackRowView(
						track: track,
						rowWidth: mix.duration)
				}
			}
		}
	}
}
