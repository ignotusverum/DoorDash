// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenueMenu.swift instead.

import Foundation
import CoreData

public enum DDVenueMenuAttributes: String {
    case categories = "categories"
    case name = "name"
}

open class _DDVenueMenu: DDModel {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "DDVenueMenu"
    }

    override open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
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
    var name: String?

    // MARK: - Relationships

}

