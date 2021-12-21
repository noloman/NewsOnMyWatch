//
//  News.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by Manuel Lorenzo (NullTwenty) on 16/12/2021.
//

import Foundation

// MARK: - NewsAPICodable
struct NewsApiCodable: Codable, Equatable, Hashable {
//    let pagination: Pagination
    let data: [News]
    
    static func == (lhs: NewsApiCodable, rhs: NewsApiCodable) -> Bool {
        return lhs.data == rhs.data
//        && lhs.pagination == rhs.pagination
    }
    
    func hash(into hasher: inout Hasher) {
//        hasher.combine(pagination)
        hasher.combine(data)
    }
}

// MARK: - Datum
struct News: Codable, Identifiable, Equatable, Hashable {
    var id: String {
        return url
    }
    let author: String?
    let title, newsDescription: String
    let url: String
    let source: String
    let image: String?
    let category: Category
    let language: Language
    let country: Country
    let publishedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case author, title
        case newsDescription = "description"
        case url, source, image, category, language, country
        case publishedAt = "published_at"
    }
}

enum Category: String, Codable {
    case general, business, entertainment, health, science, sports, technology
}

enum Country: String, Codable {
    case spain = "es"
    case egypt = "eg"
    case ma = "ma"
    case iq = "iq"
    case sd = "sd"
    case ps = "ps"
    case qatar = "qa"
}

enum Language: String, Codable {
    case spanish = "es"
    case arab = "ar"
}

// MARK: - Pagination
struct Pagination: Codable, Equatable, Hashable {
    let limit, offset, count, total: Int
}
