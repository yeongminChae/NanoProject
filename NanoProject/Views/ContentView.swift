//
//  ContentView.swift
//  NanoProject
//
//  Created by 채영민 on 2023/05/30.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white).ignoresSafeArea()

                TabView {
                    HomeTabView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("홈")
                        }
                    SearchTabView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("검색")
                        }
                    EvaluateTabView()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("평가")
                        }
                    NewsTabView()
                        .tabItem {
                            Image(systemName: "newspaper.fill")
                            Text("소식")
                        }
                    ProfileTabView()
                        .tabItem {
                            Image(systemName: "person.crop.circle.fill")
                            Text("프로필")
                        }
                }.accentColor(.pink)
            }

        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
