//
//  MobileStorageProtocol.swift
//  Exitek
//
//  Created by Нурым Нагиметов on 15.09.2022.
//

import Foundation

protocol MobileStorageProtocol {
    func getAll() -> [MobileItem]
    func findByImei(imei: String) -> MobileItem?
    func save(_ mobile: MobileItem) throws -> MobileItem
    func delete(_ product: MobileItem) throws
    func exists(_ product: MobileItem) -> Bool
}
