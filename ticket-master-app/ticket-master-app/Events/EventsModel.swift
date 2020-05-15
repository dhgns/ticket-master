

import Foundation

// MARK: - Response
struct EventsModel: Codable {
    let embedded: Embedded2
    let links: Links2
    let page: Page

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - Embedded2
struct Embedded2: Codable {
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let embedded: Embedded
    let links: Links
    let classifications: [Classification]?
    let dates: Dates?
    let id: String
    let images: [Image]
    let name: String?
    let priceRanges: [PriceRange]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case classifications, dates, id, images, name, priceRanges, url
    }
}

// MARK: - Classification
struct Classification: Codable {
    let family: Bool
    let primary: Bool
    let segment, subGenre, genre: Segment?
}

// MARK: - Segment
struct Segment: Codable {
    let id, name: String
}

// MARK: - Dates
struct Dates: Codable {
    let spanMultipleDays: Bool
    let start: Start
    let status: Status
    let timezone: String
}

// MARK: - Start
struct Start: Codable {
    let dateTBA, dateTBD: Bool?
    let dateTime, localDate, localTime: String?
    let noSpecificTime, timeTBA: Bool?
}

// MARK: - Status
struct Status: Codable {
    let code: String
}

// MARK: - Embedded
struct Embedded: Codable {
    let venues: [Venue]?
}


// MARK: - Image
struct Image: Codable {
    let fallback: Bool
    let height: Double
    let ratio, url: String
    let width: Double
}

// MARK: - Links2
struct Links2: Codable {
    let links2Self: PurpleSelf

    enum CodingKeys: String, CodingKey {
        case links2Self = "self"
    }
}

// MARK: - PurpleSelf
struct PurpleSelf: Codable {
    let href: String
}

// MARK: - UpcomingEvents2
struct UpcomingEvents2: Codable {
    let total, ticketmaster, ticketweb, tmr: Double?

    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case ticketmaster, ticketweb, tmr
    }
}

// MARK: - Venue
struct Venue: Codable {
    let links: Links2?
    let address: Address?
    let city: City?
    let location: Location?
    let name: String
    let timezone: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case links = "_links"
        case address, city, location, name,timezone, url
    }
}

// MARK: - Address
struct Address: Codable {
    let line1: String
}


// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - Country
struct Country: Codable {
    let countryCode, name: String
}





// MARK: - Location
struct Location: Codable {
    let latitude, longitude: String
}

// MARK: - State
struct State: Codable {
    let name: String
}

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let total: Double

    enum CodingKeys: String, CodingKey {
        case total = "_total"
    }
}

// MARK: - Links
struct Links: Codable {
    let attractions: [PurpleSelf]?
    let linksSelf: PurpleSelf?
    let venues: [PurpleSelf]?

    enum CodingKeys: String, CodingKey {
        case attractions
        case linksSelf = "self"
        case venues
    }
}

// MARK: - PriceRange
struct PriceRange: Codable {
    let currency: String
    let max, min: Double
    let type: String
}

// MARK: - Promoter
struct Promoter: Codable {
    let promoterDescription, id, name: String

    enum CodingKeys: String, CodingKey {
        case promoterDescription = "description"
        case id, name
    }
}

// MARK: - Sales
struct Sales: Codable {
    let presales: [Presale]?
    let salesPublic: Public?

    enum CodingKeys: String, CodingKey {
        case presales
        case salesPublic = "public"
    }
}

// MARK: - Presale
struct Presale: Codable {
    let endDateTime, name, startDateTime: String
}

// MARK: - Public
struct Public: Codable {
    let endDateTime, startDateTime: String
    let startTBD: Bool
}



// MARK: - Page
struct Page: Codable {
    let number, size, totalElements, totalPages: Double
}
