//
//  NewsTabView.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/02.
//

import SwiftUI

struct NewsTabView: View {
    var body: some View {
        ZStack {

            Rectangle()
                .foregroundColor(.pink)
                .aspectRatio(1.0,contentMode: .fit)
                .padding(20)
                .overlay(){
                    HStack{
                        Text("offset")
                    }
                    .offset(x:0, y:100)
                    HStack{
                        Text("position")
                    }
                    .position(x:0, y:100)
                }
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
