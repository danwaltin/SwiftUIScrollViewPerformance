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
	private let width: Double
	private let zoom: Double = 4
	
	init(mix: Mix) {
		self.mix = mix
		tracks = mix
			.displayTracks
			.zoomedTo(zoom: zoom)
		
		let resolution = zoom.timelineResolution

		timelineSections = mix.duration
			.timelineSections(resolution: resolution)
			.zoomedTo(zoom: zoom)
	
		width = mix.duration * zoom
	}
	
	var body: some View {
		ScrollView([.vertical, .horizontal]) {
			VStack(spacing: 0) {
				TimelineSectionsView(sections: timelineSections)
					.frame(width: width, height: 30)
				ForEach(tracks) { track in
					TrackRowView(
						track: track,
						rowWidth: width)
				}
			}
		}
		.scrollIndicators(.visible)
	}
}
