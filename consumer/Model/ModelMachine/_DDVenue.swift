// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenue.swift instead.

import Foundation
import CoreData

public enum DDVenueAttributes: String {
    case asapTime = "asapTime"
    case deliveryFee = "deliveryFee"
    case name = "name"
    case urlString = "urlString"
    case venueDescription = "venueDescription"
}

open class _DDVenue: DDModel {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "DDVenue"
    }

    override open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDVenue.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var asapTime: NSNumber?

    @NSManaged public
    var deliveryFee: NSNumber?

    @NSManaged open
    var name: String?

    @NSManaged open
    var urlString: String?

    @NSManaged open
    var venueDescription: String?

    // MARK: - Relationships

}

