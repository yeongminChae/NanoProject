//
//  MovieDetailView.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/06.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieFetcher.MovieInfos?
    @State private var isFilled:Bool = false
    
    var body: some View {
        if let movie = movie {
            VStack {
                Text(movie.title)
                    .font(.title)
                    .bold()
                    .padding()
                
                HStack {
                    Image(systemName: !isFilled ? "star" : "star.fill").foregroundColor(isFilled ? .yellow : .black.opacity(0.6))
                    Image(systemName: !isFilled ? "star" : "star.fill").foregroundColor(isFilled ? .yellow : .black.opacity(0.6))
                    Image(systemName: !isFilled ? "star" : "star.fill").foregroundColor(isFilled ? .yellow : .black.opacity(0.6))
                    Image(systemName: !isFilled ? "star" : "star.fill").foregroundColor(isFilled ? .yellow : .black.opacity(0.6))
                    Image(systemName: !isFilled ? "star" : "star.fill").foregroundColor(isFilled ? .yellow : .black.opacity(0.6))
                }
                
            }
        } else {
            Text("No movie selected")
                .font(.title)
        }
    }
}

