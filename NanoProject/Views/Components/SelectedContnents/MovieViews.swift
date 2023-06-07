//
//  MovieViews.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/02.
//

import SwiftUI

struct MovieViews: View {
    @StateObject var movieFetcher = MovieFetcher()
    @EnvironmentObject var selectedMovie: SelectedMovie2
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    MovieFetchViewModel(movieFetcher: movieFetcher, title: "박스오피스 순위", category:"now_playing")
                    MovieFetchViewModel(movieFetcher: movieFetcher, title: "역대 인기작품", category: "top_rated")
                    MovieFetchViewModel(movieFetcher: movieFetcher, title: "다가오는 작품들", category: "upcoming")
                    MovieFetchViewModel(movieFetcher: movieFetcher, title: "현재 인기작품", category: "popular")
                }
            }
        }
        
    }
}

struct MovieViews_Previews: PreviewProvider {
    static var previews: some View {
        MovieViews()
    }
}
