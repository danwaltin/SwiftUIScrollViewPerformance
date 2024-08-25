//
//  MixView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//


import SwiftUI

struct MixView: View {
	let mix: Mix
	
	var body: some View {
		ScrollView([.vertical, .horizontal]) {
			VStack(spacing: 0) {
				ForEach(mix.tracks) { track in
					TrackRowView(
						track: track,
						rowWidth: mix.width)
				}
			}
		}
	}
}