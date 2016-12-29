// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenueMenu.swift instead.

import Foundation
import CoreData

public enum DDVenueMenuAttributes: String {
    case categories = "categories"
    case menuDescription = "menuDescription"
    case minAge = "minAge"
    case name = "name"
    case priceCent = "priceCent"
    case priceWithoutInflation = "priceWithoutInflation"
    case sortingNumber = "sortingNumber"
}

public enum DDVenueMenuRelationships: String {
    case venue = "venue"
}

open class _DDVenueMenu: DDModel {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "DDVenueMenu"
    }

    override open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<DDVenueMenu> {
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, macOS 10.12, *) {
            return NSManagedObject.fetchRequest() as! NSFetchRequest<DDVenueMenu>
        } else {
            return NSFetchRequest(entityName: self.entityName())
        }
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDVenueMenu.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var categories: AnyObject?

    @NSManaged open
    var menuDescription: String?

    @NSManaged open
    var minAge: Int

    @NSManaged open
    var name: String?

    @NSManaged open
    var priceCent: Int

    @NSManaged open
    var priceWithoutInflation: Int

    @NSManaged open
    var sortingNumber: Int

    // MARK: - Relationships

    @NSManaged open
    var venue: DDVenue?

}

