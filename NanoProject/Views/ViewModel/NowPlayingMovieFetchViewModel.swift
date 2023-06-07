//
//  MovieFetchViewModel.swift
//  NanoProject
//
//  Created by 채영민 on 2023/05/31.
//

import SwiftUI

//struct NowPlayingMovieFetchViewModel: View {
//    @ObservedObject var movieFetcher = MovieFetcher()
//    @State var isLoading = true
//    let title:String
//    let category: String
//    
//    var body: some View {
//        VStack() {
//            HStack{
//                Text(title).font(.system(size: 30,weight: .bold)).frame(maxWidth:.infinity, alignment: .leading)
//                Image(systemName: "arrow.forward").padding(.horizontal)
//            }
//            
//            ZStack {
//                HStack{
//                    Circle()
//                        .trim(from: 0, to: 0.7)
//                        .stroke(Color.pink, lineWidth: 3)
//                        .frame(width: 30, height: 30)
//                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
//                        .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false), value: isLoading)
//                        .onAppear() {
//                            self.isLoading = false
//                        }
//                }.opacity(!isLoading ? 1 : 0).animation(.spring(), value: isLoading)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack{
//                        
//                        ForEach(movieFetcher.movies, id: \.id) { movie in
//                            ZStack{
//                                AsyncImage(
//                                    url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "noimage")"),
//                                    content: { image in
//                                        image.resizable()
//                                            .cornerRadius(5.0)
//                                            .frame(maxWidth: 150, maxHeight: 200)
//                                            .onAppear() {
//                                                isLoading = true
//                                            }
//                                    },
//                                    placeholder: {//
//                                    }
//                                )
//                                Text(isLoading ? movie.title : "").font(.headline).multilineTextAlignment(.center).padding(.top,240)
//                            }.frame(maxWidth:150, maxHeight:270).padding(.top, -35)
//                            Spacer()
//                        }
//                    }
//                }
//                .task {
//                    await movieFetcher.loadData(category: category)
//                }
//            }
//        }.padding(.leading, 20).frame(maxWidth: .infinity, maxHeight: 300)
//    }
//}
//
//struct NowPlayingMovieFetchViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        NowPlayingMovieFetchViewModel(title:"박스오피스 순위", category:"now_playing")
//    }
//}
