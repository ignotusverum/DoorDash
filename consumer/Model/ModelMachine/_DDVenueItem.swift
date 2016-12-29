// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenueItem.swift instead.

import Foundation
import CoreData

public enum DDVenueItemAttributes: String {
    case itemDescription = "itemDescription"
    case minAge = "minAge"
    case name = "name"
    case priceCent = "priceCent"
    case priceWithoutInflation = "priceWithoutInflation"
    case sortingNumber = "sortingNumber"
}

public enum DDVenueItemRelationships: String {
    case menu = "menu"
}

open class _DDVenueItem: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "DDVenueItem"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<DDVenueItem> {
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, macOS 10.12, *) {
            return NSManagedObject.fetchRequest() as! NSFetchRequest<DDVenueItem>
        } else {
            return NSFetchRequest(entityName: self.entityName())
        }
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDVenueItem.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var itemDescription: String?

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
    var menu: DDCategoryMenu?

}

