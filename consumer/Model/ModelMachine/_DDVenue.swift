// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenue.swift instead.

import Foundation
import CoreData

public enum DDVenueAttributes: String {
    case asapTimeMin = "asapTimeMin"
    case category = "category"
    case deliveryFeeCent = "deliveryFeeCent"
    case favorite = "favorite"
    case name = "name"
    case tags = "tags"
    case urlString = "urlString"
    case venueDescription = "venueDescription"
}

public enum DDVenueRelationships: String {
    case menu = "menu"
}

open class _DDVenue: DDModel {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "DDVenue"
    }

    override open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<DDVenue> {
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, macOS 10.12, *) {
            return NSManagedObject.fetchRequest() as! NSFetchRequest<DDVenue>
        } else {
            return NSFetchRequest(entityName: self.entityName())
        }
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

    @NSManaged open
    var asapTimeMin: Int

    @NSManaged open
    var category: String?

    @NSManaged open
    var deliveryFeeCent: Int

    @NSManaged open
    var favorite: Int

    @NSManaged open
    var name: String?

    @NSManaged open
    var tags: AnyObject?

    @NSManaged open
    var urlString: String?

    @NSManaged open
    var venueDescription: String?

    // MARK: - Relationships

    @NSManaged open
    var menu: DDVenueCategory?

}

