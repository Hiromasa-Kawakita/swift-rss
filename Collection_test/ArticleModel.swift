//
//  ArticleModel.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/07/01.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import Foundation

struct Station {
    var row: Int?
    var title: String?
    var description: String?
    var image: String?
    var link: String?
    
    init(title: String?, description: String?, image: String?, link: String?){
//        self.row = row as Int?
        
        self.title = title as String?
        self.description = description as String?
        self.image = image as String?
        self.link = link as String?
    }
}


//class Station : NSObject {
//    var title: String?
//    var image: String?
//    var link: String?
//
//    init(title: String?, image: String?, link: String?){
//        self.title = title as String?
//        self.image = image as String?
//        self.link = link as String?
//    }
//}
