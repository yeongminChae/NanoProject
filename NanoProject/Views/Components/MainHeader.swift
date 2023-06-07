//
//  MainHeader.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/02.
//

import SwiftUI

class SetIndex: ObservableObject {
    @Published var isIndex:Int = 0
}

struct MainHeader: View {
    @ObservedObject var setIndex: SetIndex
    
    var body: some View {
        HStack {
            
            Text("영화")
                .onTapGesture {
                    setIndex.isIndex = 0
                }
                .opacity(setIndex.isIndex == 0 ? 1 : 0.5)
                .animation(.spring(), value: setIndex.isIndex)
            Text("|").opacity(0.5).font(.system(size: 15, weight: .medium)).padding(.horizontal, 5)
            Text("TV")
                .onTapGesture {
                    setIndex.isIndex = 1
                }
                .opacity(setIndex.isIndex == 1 ? 1 : 0.5)
                .animation(.spring(), value: setIndex.isIndex)
            Text("|").opacity(0.5).font(.system(size: 15, weight: .medium)).padding(.horizontal, 5)
            Text("책")
                .onTapGesture {
                    setIndex.isIndex = 2
                }
                .opacity(setIndex.isIndex == 2 ? 1 : 0.5)
                .animation(.spring(), value: setIndex.isIndex)
            Text("|").opacity(0.5).font(.system(size: 15, weight: .medium)).padding(.horizontal, 5)
            Text("웹툰")
                .onTapGesture {
                    setIndex.isIndex = 3
                }
                .opacity(setIndex.isIndex == 3 ? 1 : 0.5)
                .animation(.spring(), value: setIndex.isIndex)
            Spacer()
        }
        .font(.system(size: 33, weight: .bold))
        .padding(.leading)
        .padding(.top, -20)
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader(setIndex: SetIndex())
    }
}
