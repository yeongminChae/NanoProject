//
//  HomeTabView.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/02.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject static var movieFetcher = MovieFetcher()
    @ObservedObject var setIndex = SetIndex()
    @EnvironmentObject var selectedMovie: SelectedMovie2
    @State var isLoading = true
    @State var processLoading = true
    @State var isIndex:Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.white).ignoresSafeArea()
                
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.pink, lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: processLoading ? 0 : 360))
                        .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false), value: processLoading)
                }
                .onAppear() {
                    processLoading.toggle()
                }
                .opacity(isLoading ? 1 : 0).animation(.spring(), value: processLoading)
                
                VStack {
                    
                    MainHeader(setIndex: setIndex)
                        .padding(.leading, 2)
                        .padding(.top, 57.5)
    
                    Spacer()
                    
                    VStack {
                        
                        if setIndex.isIndex == 0 {
                            MovieViews()
                                .transition(AnyTransition.move(edge: .leading))
                                .animation(.spring())
                                .background(
                                    NavigationLink(
                                        destination: MovieDetailView(movie: selectedMovie.movie),
                                        isActive: Binding<Bool>(
                                            get: { selectedMovie.movie != nil },
                                            set: { _ in selectedMovie.movie = nil }),
                                        label: { EmptyView() }
                                    )
                                    .hidden()
                                )
                        } else if setIndex.isIndex == 1 {
                            Page1()
                                .transition(AnyTransition.move(edge: .leading))
                                .animation(.spring())
                        } else if setIndex.isIndex == 2 {
                            Page2()
                                .transition(AnyTransition.move(edge: .leading))
                                .animation(.spring())
                        } else {
                            Page3()
                                .transition(AnyTransition.move(edge: .leading))
                                .animation(.spring())
                        }
                    }
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isLoading.toggle()
                        }
                    }
                    .opacity(isLoading ? 0 : 1)
                    Spacer()
                }
            }
        }
        
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
