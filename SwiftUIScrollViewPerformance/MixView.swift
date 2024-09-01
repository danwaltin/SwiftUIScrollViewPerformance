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
		VStack(spacing: 0) {
			EditMixView(mix: mix)
			EditMixBottomToolbar(numberOfTracks: mix.tracks.count)
		}
	}
}




