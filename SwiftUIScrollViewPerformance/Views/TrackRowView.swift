//
//  TrackRowView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

fileprivate let trackRowBackground: HierarchicalShapeStyle = .quinary

fileprivate struct TrackBackgroundShapeStyle: ShapeStyle {
	func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
		Color.blue.opacity(0.2)
	}
}

fileprivate struct TrackBorderShapeStyle: ShapeStyle {
	func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
		Color.blue.opacity(0.7)
	}
}

extension ShapeStyle where Self == TrackBackgroundShapeStyle {
	static var trackBackground: TrackBackgroundShapeStyle {
		TrackBackgroundShapeStyle()
	}
	
	static var trackBorder: TrackBorderShapeStyle {
		TrackBorderShapeStyle()
	}
}

struct TrackRowView: View {
	let track: TrackDisplayModel
	let rowWidth: Double

	var body: some View {
		ZStack(alignment: .leading) {
			Rectangle()
				.fill(trackRowBackground)
				.frame(width: rowWidth)
			HStack(spacing: 0) {
				Color.clear
					.frame(width: track.displayPosition)
				Rectangle()
					.fill(.trackBackground)
					.clipShape(RoundedRectangle(cornerRadius: 6))
					.frame(width: track.displayWidth, height: 120)
			}
		}
	}
}
