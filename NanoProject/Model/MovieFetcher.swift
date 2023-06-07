//
//  TopRatedMovie.swift
//  NanoProject
//
//  Created by 채영민 on 2023/05/30.
//

import Foundation

class MovieFetcher: ObservableObject {
    @Published var topRatedMovies: [MovieInfos] = []
    @Published var nowPlayingMovies: [MovieInfos] = []
    @Published var upcomingMovies: [MovieInfos] = []
    @Published var popularMovies: [MovieInfos] = []
    @Published var isLoading: Bool = true
    
    struct MovieInfos: Codable, Identifiable {
        let id: Int
        let title: String
        let overview: String
        let vote_count: Int
        let vote_average: Float
        let release_date: String
        let backdrop_path: String?
        let poster_path: String?
    }

    struct MovieResponse: Codable {
        let results: [MovieInfos]
    }
    
    func loadData(category: String) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(category)?api_key=3b45f9cc2e4aedf5c5acc1163b12b24c&language=ko-KR&page=1")
        else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    switch category {
                    case "top_rated":
                        self.topRatedMovies = decodedData.results
                    case "now_playing":
                        self.nowPlayingMovies = decodedData.results
                    case "upcoming":
                        self.upcomingMovies = decodedData.results
                    case "popular":
                        self.popularMovies = decodedData.results
                    default:
                        break
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
