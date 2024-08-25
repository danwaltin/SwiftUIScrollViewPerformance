//
//  ContentView.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-08-25.
//

import SwiftUI

struct Track : Identifiable {
	let id: Int
	let title: String
	let displayPosition: Double
	let displayWidth: Double
}

struct Mix: Identifiable {
	let id: Int
	let tracks: [Track]
}

let tracks = [
	Track(id: 0, title: "Dancing Queen",                  displayPosition: 0,    displayWidth: 200),
	Track(id: 1, title: "Bjekkergauken",                  displayPosition: 190,  displayWidth: 300),
	Track(id: 2, title: "Animals",                        displayPosition: 480,  displayWidth: 100),
	Track(id: 3, title: "Always Look On the Bright Side", displayPosition: 570,  displayWidth: 250),
	Track(id: 4, title: "Längtan till landet",            displayPosition: 790,  displayWidth: 220),
 	Track(id: 5, title: "Söndermarken",                   displayPosition: 1000, displayWidth: 200),
 	Track(id: 6, title: "Happyland",                      displayPosition: 1200, displayWidth: 300),
 	Track(id: 7, title: "How Much Is the Fish",           displayPosition: 1500, displayWidth: 75),
 	Track(id: 8, title: "Boom Boom Ba",                   displayPosition: 1520, displayWidth: 100)
]

let mix = Mix(id: 100, tracks: tracks)

extension Mix {
	var width: Double {
		(tracks.last?.displayPosition ?? 0) + (tracks.last?.displayWidth ?? 0)
	}
}

let trackRowBackground: HierarchicalShapeStyle = .quinary

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

struct ContentView: View {
    var body: some View {
		MixView(mix: mix)
    }
}

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
struct TrackRowView: View {
	let track: Track
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

#Preview {
    ContentView()
}

