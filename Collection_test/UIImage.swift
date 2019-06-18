//
//  UIImage.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/06/18.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import UIKit

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
