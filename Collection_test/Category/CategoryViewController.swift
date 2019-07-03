//
//  CategoryViewController.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/06/12.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var articles: [[String: String?]] = [] // 記事を入れるプロパティを定義
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        getArticles()
        
        //Xib
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.categoryCollectionView.register(nib, forCellWithReuseIdentifier: "categoryCell")
    }
    
    func getArticles() { Alamofire.request("https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Flifehacking.jp%2Ffeed%2Fatom%2F", method: .get)
        .responseJSON { response in
            //                print(response.result.value)
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            //            print(json)
            
            json["items"].forEach { (_, json) in
                //                    print(json)
                //                    print(json["items"]["title"].string)
                let article: [String: String?] = [
                    "title": json["title"].string,
                    //                    "description": json["description"].string,
                    "image": json["thumbnail"].string
                ] // 1つの記事を表す辞書型を作る
                self.articles.append(article) // 配列に入れる
            }
            //            print(self.articles)
            self.categoryCollectionView.reloadData()
        }
    }
}

extension CategoryViewController: UICollectionViewDelegate {
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryLabel.text = ""
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = UIScreen.main.bounds.width * 0.47
        return CGSize(width: widthSize, height: widthSize)
    }
}
