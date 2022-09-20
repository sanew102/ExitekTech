//
//  MobileItem+CoreDataProperties.swift
//  Exitek
//
//  Created by Нурым Нагиметов on 15.09.2022.
//
//

import Foundation
import CoreData


extension MobileItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MobileItem> {
        return NSFetchRequest<MobileItem>(entityName: "MobileItem")
    }

    @NSManaged public var imei: String?
    @NSManaged public var model: String?

}

extension MobileItem : Identifiable {

}
