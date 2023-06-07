//
//  SwiftUIView.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/01.
//

import SwiftUI

class SelectedMovie2 : ObservableObject {
    @Published var movie: MovieFetcher.MovieInfos?
}

struct MovieFetchViewModel: View {
    @ObservedObject var movieFetcher = MovieFetcher()
    @State var isLoading = true
    let title:String
    let category: String
    @EnvironmentObject var selectedMovie: SelectedMovie2
    
    var body: some View {
        NavigationView {
            
            VStack() {
                
                HStack{
                    Text(title).font(.system(size: 30,weight: .bold)).frame(maxWidth:.infinity, alignment: .leading)
                    Image(systemName: "arrow.forward").padding(.horizontal)
                }
                
                ZStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(
                                category == "top_rated" ? movieFetcher.topRatedMovies :
                                    category ==  "now_playing" ? movieFetcher.nowPlayingMovies :
                                    category ==  "upcoming" ? movieFetcher.upcomingMovies :
                                    movieFetcher.popularMovies , id: \.id) { movie in
                                        ZStack{
                                            AsyncImage(
                                                url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "noimage")"),
                                                content: { image in
                                                    image.resizable()
                                                        .cornerRadius(5.0)
                                                        .frame(maxWidth: 150, maxHeight: 200)
                                                        .onAppear() {
                                                            isLoading = true
                                                        }
                                                },
                                                placeholder: {//
                                                }
                                            )
                                            
                                            Text(isLoading ? movie.title : "").font(.headline).multilineTextAlignment(.center).padding(.top,240)
                                        }
                                        .onTapGesture {
                                            selectedMovie.movie = movie
                                        }
                                        .frame(maxWidth:150, maxHeight:270).padding(.top, -35)
                                        
                                        Spacer()
                                    }
                        }
                    }
                    
                    .task {
                        await movieFetcher.loadData(category: category)
                    }

                }
            }.padding(.leading, 20).frame(maxWidth: .infinity, maxHeight: 300)
            
        }
        
        
    }
}

