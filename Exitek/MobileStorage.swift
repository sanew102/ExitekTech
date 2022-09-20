//
//  MobileStorage.swift
//  Exitek
//
//  Created by Нурым Нагиметов on 15.09.2022.
//

import Foundation
import UIKit
struct MobileStorage: MobileStorageProtocol {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAll() -> [MobileItem] {
        do {
            let items = try context.fetch(MobileItem.fetchRequest())
            print(items)
            return items
        }
        catch {
            print("getAll error")
            return []
        }
    }
    
    func findByImei(imei: String) -> MobileItem? {
        do {
            let items = try context.fetch(MobileItem.fetchRequest())
            for item in items {
                if item.imei == imei {
                    print(item)
                    return item
                }
            }
        }
        catch {
            print("findByImei error")
        }
        return nil
    }
    
    func save(_ mobile: MobileItem) throws -> MobileItem {
        let newItem = MobileItem(context: context)
        newItem.imei = mobile.imei
        newItem.model = mobile.model
        do {
            if !exists(newItem){
                try! context.save()
            }
        }
        catch {
            print("saving erroe")
        }
        return newItem
    }
    
    func delete(_ product: MobileItem) throws {
        context.delete(product)
        do {
            try context.save()
        }
        catch {
            print("deletion error")
        }
    }
    
    func exists(_ product: MobileItem) -> Bool {
        let findByImei = findByImei(imei: product.imei!)
        print(findByImei != nil)
        return findByImei != nil
    }
}
