//
//  EditMixView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

fileprivate let trackIds = [1, 2, 3, 4, 5, 6, 7, 8, 9]
fileprivate let trackDuration: TimeInterval = 3.min + 30.sec
fileprivate let totalDuration = trackDuration * Double(trackIds.count)
fileprivate let zoom: Double = 4
fileprivate let resolution = zoom.timelineResolution

struct EditMixView : View {
	private let timelineSections = totalDuration
		.timelineSections(resolution: resolution)
		   .zoomedTo(zoom: zoom)
	private let tracks: [TrackDisplayModel] = trackIds.map {TrackDisplayModel(
		id: $0,
		title: "Track \($0)",
		displayPosition: Double($0 - 1) * trackDuration,
		displayWidth: trackDuration)}
		.zoomedTo(zoom: zoom)
	private let width = totalDuration * zoom
	
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
