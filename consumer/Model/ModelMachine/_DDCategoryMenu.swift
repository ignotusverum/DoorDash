// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDCategoryMenu.swift instead.

import Foundation
import CoreData

public enum DDCategoryMenuAttributes: String {
    case sortID = "sortID"
    case subtitle = "subtitle"
    case title = "title"
}

public enum DDCategoryMenuRelationships: String {
    case category = "category"
    case items = "items"
}

open class _DDCategoryMenu: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "DDCategoryMenu"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<DDCategoryMenu> {
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, macOS 10.12, *) {
            return NSManagedObject.fetchRequest() as! NSFetchRequest<DDCategoryMenu>
        } else {
            return NSFetchRequest(entityName: self.entityName())
        }
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDCategoryMenu.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var sortID: Int

    @NSManaged open
    var subtitle: String?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var category: DDVenueCategory?

    @NSManaged open
    var items: NSSet

    open func itemsSet() -> NSMutableSet {
        return self.items.mutableCopy() as! NSMutableSet
    }

}

extension _DDCategoryMenu {

    open func addItems(_ objects: NSSet) {
        let mutable = self.items.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.items = mutable.copy() as! NSSet
    }

    open func removeItems(_ objects: NSSet) {
        let mutable = self.items.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.items = mutable.copy() as! NSSet
    }

    open func addItemsObject(_ value: DDVenueItem) {
        let mutable = self.items.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.items = mutable.copy() as! NSSet
    }

    open func removeItemsObject(_ value: DDVenueItem) {
        let mutable = self.items.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.items = mutable.copy() as! NSSet
    }

}
