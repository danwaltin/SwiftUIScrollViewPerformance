//
//  TrackRowView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct TrackRowView: View {
	let track: TrackDisplayModel
	let rowWidth: Double

	var body: some View {
		ZStack(alignment: .leading) {
			Rectangle()
				.fill(.quinary)
				.frame(width: rowWidth)
			HStack(spacing: 0) {
				Color.clear
					.frame(width: track.displayPosition)
				Rectangle()
					.fill(Color.blue.opacity(0.2))
					.clipShape(RoundedRectangle(cornerRadius: 6))
					.frame(width: track.displayWidth, height: 120)
			}
		}
	}
}
