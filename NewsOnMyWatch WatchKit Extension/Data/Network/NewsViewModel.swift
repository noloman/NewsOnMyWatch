//
//  ApiClient.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo Parejo (NullTwenty) on 21/12/2021.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published private(set) var isFetching = false
    @Published private(set) var newsList: [ArticleCodable] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        fetchNews(country: .us)
    }
    
    private func fetchNews(country: Country? = nil) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/top-headlines"
        
        let accessKeyQueryItem: URLQueryItem = URLQueryItem(name: "apiKey", value: "d2250a074fa44c3d98d1ae47faa71caf")
        components.queryItems = [
            accessKeyQueryItem
        ]
        
        if let country = country {
            components.queryItems?.append(URLQueryItem(name: "country", value: country.rawValue))
        }
        
        isFetching = true
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared.dataTaskPublisher(for: components.url!)
            .retry(1)
            .map(\.data)
            .decode(type: NewsResponseCodable.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isFetching = false
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    print("Unable to Fetch News \(error)")
                }
            }, receiveValue: { [weak self] newsApiCodable in
                self?.newsList = newsApiCodable.articles
            }).store(in: &subscriptions)
    }
}
