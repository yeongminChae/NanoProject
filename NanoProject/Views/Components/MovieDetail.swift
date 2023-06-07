//
//  MovieDetail.swift
//  NanoProject
//
//  Created by 채영민 on 2023/06/06.
//

import SwiftUI

struct MovieDetail: View {
    @ObservedObject var movieFetcher = MovieFetcher()
    
    var body: some View {
        Text(movie.title)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail()
    }
}
