// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DDVenueCategory.swift instead.

import Foundation
import CoreData

public enum DDVenueCategoryAttributes: String {
    case headerImageString = "headerImageString"
    case isCathering = "isCathering"
    case name = "name"
    case openHours = "openHours"
    case sortID = "sortID"
    case statusString = "statusString"
    case subtitle = "subtitle"
}

public enum DDVenueCategoryRelationships: String {
    case menus = "menus"
    case venue = "venue"
}

open class _DDVenueCategory: DDModel {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "DDVenueCategory"
    }

    override open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<DDVenueCategory> {
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, macOS 10.12, *) {
            return NSManagedObject.fetchRequest() as! NSFetchRequest<DDVenueCategory>
        } else {
            return NSFetchRequest(entityName: self.entityName())
        }
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _DDVenueCategory.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var headerImageString: String?

    @NSManaged open
    var isCathering: Bool

    @NSManaged open
    var name: String?

    @NSManaged open
    var openHours: AnyObject?

    @NSManaged open
    var sortID: Int

    @NSManaged open
    var statusString: String?

    @NSManaged open
    var subtitle: String?

    // MARK: - Relationships

    @NSManaged open
    var menus: NSSet

    open func menusSet() -> NSMutableSet {
        return self.menus.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var venue: DDVenue?

}

extension _DDVenueCategory {

    open func addMenus(_ objects: NSSet) {
        let mutable = self.menus.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.menus = mutable.copy() as! NSSet
    }

    open func removeMenus(_ objects: NSSet) {
        let mutable = self.menus.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.menus = mutable.copy() as! NSSet
    }

    open func addMenusObject(_ value: DDCategoryMenu) {
        let mutable = self.menus.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.menus = mutable.copy() as! NSSet
    }

    open func removeMenusObject(_ value: DDCategoryMenu) {
        let mutable = self.menus.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.menus = mutable.copy() as! NSSet
    }

}
