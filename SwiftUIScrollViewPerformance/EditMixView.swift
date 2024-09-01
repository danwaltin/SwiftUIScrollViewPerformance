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
	
	init(mix: Mix) {
		self.mix = mix
		timelineSections = 45.min
			.timelineSections(resolution: .tenSeconds)
	}
	
	var body: some View {
		ScrollView([.vertical, .horizontal]) {
			VStack(spacing: 0) {
				TimelineSectionsView(sections: timelineSections)
					.frame(width: mix.width, height: 30)
				ForEach(mix.tracks) { track in
					TrackRowView(
						track: track,
						rowWidth: mix.width)
				}
			}
		}
	}
}
