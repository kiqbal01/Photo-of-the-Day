//
//  Model.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/19/23.
//

import Foundation

// MARK: - GLOBAL Variabls

let API_APOD: String = "api.nasa.gov"
let API_KEY: String = "24Uu6MR7Qh1SrknU5LkHHleAhcHIChbtcV2s5kKq"

let API_SEARCH: String = "images-api.nasa.gov"

// MARK: - APOD Models

struct ImageOfDay: Codable {
    let copyright, date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

// MARK: - Welcome
struct Welcome: Codable, Hashable {
    let collection: Collection?
}

// MARK: - Collection
struct Collection: Codable, Hashable {
    let version: String?
    let href: String?
    let items: [Item]?
    let metadata: Metadata?
    let links: [CollectionLink]?
}

// MARK: - Item
struct Item: Codable, Hashable {
    let href: String?
    let data: [Datum]?
    let links: [ItemLink]?
}

// MARK: - Datum
struct Datum: Codable, Hashable {
    let description, title: String?
    let keywords: [String]?
    let nasaID: String?
    let mediaType: MediaType?
    let dateCreated: String?
    let description508, center, photographer, location: String?
    let album: [String]?
    let secondaryCreator: String?

    enum CodingKeys: String, CodingKey, Hashable {
        case description, title, keywords
        case nasaID = "nasa_id"
        case mediaType = "media_type"
        case dateCreated = "date_created"
        case description508 = "description_508"
        case center, photographer, location, album
        case secondaryCreator = "secondary_creator"
    }
}

enum MediaType: String, Codable, Hashable {
    case audio = "audio"
    case image = "image"
    case video = "video"
}

// MARK: - ItemLink
struct ItemLink: Codable, Hashable {
    let href: String?
    let rel: Rel?
    let render: MediaType?
}

enum Rel: String, Codable, Hashable {
    case captions = "captions"
    case preview = "preview"
}

// MARK: - CollectionLink
struct CollectionLink: Codable, Hashable {
    let rel, prompt: String?
    let href: String?
}

// MARK: - Metadata
struct Metadata: Codable, Hashable {
    let totalHits: Int?

    enum CodingKeys: String, CodingKey, Hashable {
        case totalHits = "total_hits"
    }
}

// MARK: - Errors


enum NetworkingError: Error{
    case invalidURL(String?)
    case invalidData
    case invalidResponse
    
}


