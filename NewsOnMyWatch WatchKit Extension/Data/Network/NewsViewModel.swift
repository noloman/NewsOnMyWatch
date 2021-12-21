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
    @Published private(set) var newsList: [News] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        fetchNews(language: .spanish, country: .spain)
    }
    
    private func fetchNews(language: Language? = nil, country: Country? = nil) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.mediastack.com"
        components.path = "/v1/news"
        
        let accessKeyQueryItem: URLQueryItem = URLQueryItem(name: "access_key", value: "70c71113da48e2f0b27e23aa474f4fc3")
        components.queryItems = [
            accessKeyQueryItem
        ]
        
        if let language = language {
            components.queryItems?.append(URLQueryItem(name: "languages", value: language.rawValue))
        }
        
        if let country = country {
            components.queryItems?.append(URLQueryItem(name: "countries", value: country.rawValue))
        }
        
        isFetching = true
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared.dataTaskPublisher(for: components.url!)
            .retry(1)
            .map(\.data)
            .decode(type: NewsApiCodable.self, decoder: decoder)
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
                self?.newsList = newsApiCodable.data
            }).store(in: &subscriptions)
    }
}
