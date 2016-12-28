// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDModel.swift instead.

import Foundation
import CoreData

public enum DDModelAttributes: String {
    case modelID = "modelID"
}

open class _DDModel: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "DDModel"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDModel.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var modelID: String?

    // MARK: - Relationships

}

