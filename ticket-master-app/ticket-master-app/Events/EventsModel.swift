
import Foundation
import Alamofire

// MARK: - EventsResponse
class EventsResponse: Codable {
    let embedded: EventsResponseEmbedded?
    let links: AttractionLinks
    let page: Page

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }

    init(embedded: EventsResponseEmbedded, links: AttractionLinks, page: Page) {
        self.embedded = embedded
        self.links = links
        self.page = page
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEventsResponseEmbedded { response in
//     if let eventsResponseEmbedded = response.result.value {
//       ...
//     }
//   }

// MARK: - EventsResponseEmbedded
class EventsResponseEmbedded: Codable {
    let events: [Event]

    init(events: [Event]) {
        self.events = events
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEvent { response in
//     if let event = response.result.value {
//       ...
//     }
//   }

// MARK: - Event
class Event: Codable {
    let name, type, id: String
    let test: Bool
    let url: String
    let locale: String
    let images: [Image]
    let sales: Sales
    let dates: Dates
    let classifications: [EventClassification]
    let promoter: Promoter
    let promoters: [Promoter]
    let links: EventLinks
    let embedded: EventEmbedded

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, sales, dates, classifications, promoter, promoters
        case links = "_links"
        case embedded = "_embedded"
    }

    init(name: String, type: String, id: String, test: Bool, url: String, locale: String, images: [Image], sales: Sales, dates: Dates, classifications: [EventClassification], promoter: Promoter, promoters: [Promoter], links: EventLinks, embedded: EventEmbedded) {
        self.name = name
        self.type = type
        self.id = id
        self.test = test
        self.url = url
        self.locale = locale
        self.images = images
        self.sales = sales
        self.dates = dates
        self.classifications = classifications
        self.promoter = promoter
        self.promoters = promoters
        self.links = links
        self.embedded = embedded
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEventClassification { response in
//     if let eventClassification = response.result.value {
//       ...
//     }
//   }

// MARK: - EventClassification
class EventClassification: Codable {
    let primary: Bool
    let segment, genre, subGenre: Promoter
    let family: Bool

    init(primary: Bool, segment: Promoter, genre: Promoter, subGenre: Promoter, family: Bool) {
        self.primary = primary
        self.segment = segment
        self.genre = genre
        self.subGenre = subGenre
        self.family = family
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePromoter { response in
//     if let promoter = response.result.value {
//       ...
//     }
//   }

// MARK: - Promoter
class Promoter: Codable {
    let id, name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDates { response in
//     if let dates = response.result.value {
//       ...
//     }
//   }

// MARK: - Dates
class Dates: Codable {
    let access: Access
    let start: Start
    let timezone: String
    let status: Status
    let spanMultipleDays: Bool

    init(access: Access, start: Start, timezone: String, status: Status, spanMultipleDays: Bool) {
        self.access = access
        self.start = start
        self.timezone = timezone
        self.status = status
        self.spanMultipleDays = spanMultipleDays
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAccess { response in
//     if let access = response.result.value {
//       ...
//     }
//   }

// MARK: - Access
class Access: Codable {
    let startDateTime: Date
    let startApproximate, endApproximate: Bool

    init(startDateTime: Date, startApproximate: Bool, endApproximate: Bool) {
        self.startDateTime = startDateTime
        self.startApproximate = startApproximate
        self.endApproximate = endApproximate
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStart { response in
//     if let start = response.result.value {
//       ...
//     }
//   }

// MARK: - Start
class Start: Codable {
    let localDate: String
    let localTime: String?
    let dateTime: Date?
    let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool

    init(localDate: String, localTime: String?, dateTime: Date?, dateTBD: Bool, dateTBA: Bool, timeTBA: Bool, noSpecificTime: Bool) {
        self.localDate = localDate
        self.localTime = localTime
        self.dateTime = dateTime
        self.dateTBD = dateTBD
        self.dateTBA = dateTBA
        self.timeTBA = timeTBA
        self.noSpecificTime = noSpecificTime
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStatus { response in
//     if let status = response.result.value {
//       ...
//     }
//   }

// MARK: - Status
class Status: Codable {
    let code: String

    init(code: String) {
        self.code = code
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEventEmbedded { response in
//     if let eventEmbedded = response.result.value {
//       ...
//     }
//   }

// MARK: - EventEmbedded
class EventEmbedded: Codable {
    let venues: [Venue]
    let attractions: [Attraction]

    init(venues: [Venue], attractions: [Attraction]) {
        self.venues = venues
        self.attractions = attractions
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAttraction { response in
//     if let attraction = response.result.value {
//       ...
//     }
//   }

// MARK: - Attraction
class Attraction: Codable {
    let name, type, id: String
    let test: Bool
    let url: String
    let locale: String
    let externalLinks: ExternalLinks?
    let images: [Image]
    let classifications: [AttractionClassification]
    let upcomingEvents: UpcomingEvents
    let links: AttractionLinks

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, externalLinks, images, classifications, upcomingEvents
        case links = "_links"
    }

    init(name: String, type: String, id: String, test: Bool, url: String, locale: String, externalLinks: ExternalLinks?, images: [Image], classifications: [AttractionClassification], upcomingEvents: UpcomingEvents, links: AttractionLinks) {
        self.name = name
        self.type = type
        self.id = id
        self.test = test
        self.url = url
        self.locale = locale
        self.externalLinks = externalLinks
        self.images = images
        self.classifications = classifications
        self.upcomingEvents = upcomingEvents
        self.links = links
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAttractionClassification { response in
//     if let attractionClassification = response.result.value {
//       ...
//     }
//   }

// MARK: - AttractionClassification
class AttractionClassification: Codable {
    let primary: Bool
    let segment, genre, subGenre, type: Promoter
    let subType: Promoter
    let family: Bool

    init(primary: Bool, segment: Promoter, genre: Promoter, subGenre: Promoter, type: Promoter, subType: Promoter, family: Bool) {
        self.primary = primary
        self.segment = segment
        self.genre = genre
        self.subGenre = subGenre
        self.type = type
        self.subType = subType
        self.family = family
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseExternalLinks { response in
//     if let externalLinks = response.result.value {
//       ...
//     }
//   }

// MARK: - ExternalLinks
class ExternalLinks: Codable {
    let twitter, itunes, lastfm, facebook: [Facebook]
    let wiki, instagram: [Facebook]
    let musicbrainz: [Musicbrainz]
    let homepage: [Facebook]

    init(twitter: [Facebook], itunes: [Facebook], lastfm: [Facebook], facebook: [Facebook], wiki: [Facebook], instagram: [Facebook], musicbrainz: [Musicbrainz], homepage: [Facebook]) {
        self.twitter = twitter
        self.itunes = itunes
        self.lastfm = lastfm
        self.facebook = facebook
        self.wiki = wiki
        self.instagram = instagram
        self.musicbrainz = musicbrainz
        self.homepage = homepage
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFacebook { response in
//     if let facebook = response.result.value {
//       ...
//     }
//   }

// MARK: - Facebook
class Facebook: Codable {
    let url: String

    init(url: String) {
        self.url = url
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMusicbrainz { response in
//     if let musicbrainz = response.result.value {
//       ...
//     }
//   }

// MARK: - Musicbrainz
class Musicbrainz: Codable {
    let id: String

    init(id: String) {
        self.id = id
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseImage { response in
//     if let image = response.result.value {
//       ...
//     }
//   }

// MARK: - Image
class Image: Codable {
    let ratio: Ratio
    let url: String
    let width, height: Int
    let fallback: Bool

    init(ratio: Ratio, url: String, width: Int, height: Int, fallback: Bool) {
        self.ratio = ratio
        self.url = url
        self.width = width
        self.height = height
        self.fallback = fallback
    }
}

enum Ratio: String, Codable {
    case the16_9 = "16_9"
    case the3_2 = "3_2"
    case the4_3 = "4_3"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAttractionLinks { response in
//     if let attractionLinks = response.result.value {
//       ...
//     }
//   }

// MARK: - AttractionLinks
class AttractionLinks: Codable {
    let linksSelf: SelfElement

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }

    init(linksSelf: SelfElement) {
        self.linksSelf = linksSelf
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSelfElement { response in
//     if let selfElement = response.result.value {
//       ...
//     }
//   }

// MARK: - SelfElement
class SelfElement: Codable {
    let href: String

    init(href: String) {
        self.href = href
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUpcomingEvents { response in
//     if let upcomingEvents = response.result.value {
//       ...
//     }
//   }

// MARK: - UpcomingEvents
class UpcomingEvents: Codable {
    let total, mfxEs: Int

    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case mfxEs = "mfx-es"
    }

    init(total: Int, mfxEs: Int) {
        self.total = total
        self.mfxEs = mfxEs
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseVenue { response in
//     if let venue = response.result.value {
//       ...
//     }
//   }

// MARK: - Venue
class Venue: Codable {
    let name, type, id: String
    let test: Bool
    let url: String
    let locale, postalCode, timezone: String
    let city, state: City
    let country: Country
    let address: Address
    let location: Location
    let upcomingEvents: UpcomingEvents
    let links: AttractionLinks

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, postalCode, timezone, city, state, country, address, location, upcomingEvents
        case links = "_links"
    }

    init(name: String, type: String, id: String, test: Bool, url: String, locale: String, postalCode: String, timezone: String, city: City, state: City, country: Country, address: Address, location: Location, upcomingEvents: UpcomingEvents, links: AttractionLinks) {
        self.name = name
        self.type = type
        self.id = id
        self.test = test
        self.url = url
        self.locale = locale
        self.postalCode = postalCode
        self.timezone = timezone
        self.city = city
        self.state = state
        self.country = country
        self.address = address
        self.location = location
        self.upcomingEvents = upcomingEvents
        self.links = links
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAddress { response in
//     if let address = response.result.value {
//       ...
//     }
//   }

// MARK: - Address
class Address: Codable {
    let line1: String

    init(line1: String) {
        self.line1 = line1
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCity { response in
//     if let city = response.result.value {
//       ...
//     }
//   }

// MARK: - City
class City: Codable {
    let name: String

    init(name: String) {
        self.name = name
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCountry { response in
//     if let country = response.result.value {
//       ...
//     }
//   }

// MARK: - Country
class Country: Codable {
    let name, countryCode: String

    init(name: String, countryCode: String) {
        self.name = name
        self.countryCode = countryCode
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLocation { response in
//     if let location = response.result.value {
//       ...
//     }
//   }

// MARK: - Location
class Location: Codable {
    let longitude, latitude: String

    init(longitude: String, latitude: String) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEventLinks { response in
//     if let eventLinks = response.result.value {
//       ...
//     }
//   }

// MARK: - EventLinks
class EventLinks: Codable {
    let linksSelf: SelfElement
    let attractions, venues: [SelfElement]

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case attractions, venues
    }

    init(linksSelf: SelfElement, attractions: [SelfElement], venues: [SelfElement]) {
        self.linksSelf = linksSelf
        self.attractions = attractions
        self.venues = venues
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSales { response in
//     if let sales = response.result.value {
//       ...
//     }
//   }

// MARK: - Sales
class Sales: Codable {
    let salesPublic: Public

    enum CodingKeys: String, CodingKey {
        case salesPublic = "public"
    }

    init(salesPublic: Public) {
        self.salesPublic = salesPublic
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePublic { response in
//     if let public = response.result.value {
//       ...
//     }
//   }

// MARK: - Public
class Public: Codable {
    let startDateTime: Date
    let startTBD: Bool
    let endDateTime: Date

    init(startDateTime: Date, startTBD: Bool, endDateTime: Date) {
        self.startDateTime = startDateTime
        self.startTBD = startTBD
        self.endDateTime = endDateTime
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePage { response in
//     if let page = response.result.value {
//       ...
//     }
//   }

// MARK: - Page
class Page: Codable {
    let size, totalElements, totalPages, number: Int

    init(size: Int, totalElements: Int, totalPages: Int, number: Int) {
        self.size = size
        self.totalElements = totalElements
        self.totalPages = totalPages
        self.number = number
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}


