//
//  NewsApiError.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo Parejo (NullTwenty) on 20/12/2021.
//
import Foundation

// MARK: - NewsResponseCodable
struct NewsResponseCodable: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleCodable]
}

// MARK: - Article
struct ArticleCodable: Codable, Equatable, Identifiable {
    var id: String {
        url
    }
    let source: SourceCodable
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct SourceCodable: Codable, Identifiable, Equatable {
    let id: String?
    let name: String
}

enum Country: String, Codable {
    case spain = "es"
    case egypt = "eg"
    case ma = "ma"
    case iq = "iq"
    case sd = "sd"
    case ps = "ps"
    case qatar = "qa"
    case us
    case nl
}

enum Language: String, Codable {
    case spanish = "es"
    case arab = "ar"
}
