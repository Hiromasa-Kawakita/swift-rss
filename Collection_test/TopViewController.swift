//
//  TopViewController.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/06/10.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TopViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //let models = Model.createModels()
    var articles: [[String: String?]] = [] // 記事を入れるプロパティを定義
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "API"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getArticles()
        
        //Xib
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    func getArticles() { Alamofire.request("https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fblog.livedoor.jp%2Fdqnplus%2Findex.rdf", method: .get)
        .responseJSON { response in
            //                print(response.result.value)
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            print(json)
            
            json["items"].forEach { (_, json) in
                //                    print(json)
                //                    print(json["items"]["title"].string)
                let article: [String: String?] = [
                    "title": json["title"].string,
                    "description": json["description"].string,
                    "image": json["thumbnail"].string
                ] // 1つの記事を表す辞書型を作る
                self.articles.append(article) // 配列に入れる
            }
            //print(self.articles)
            self.collectionView.reloadData()
        }
    }
}

extension TopViewController: UICollectionViewDelegate {
}

extension TopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let article = articles[indexPath.row]
        cell.label.text = "タイトル：" + article["title"]!!
        //        cell.subLabel.text = article["description"]!
        //          cell.subLabel.text = "ユーザネーム：" + article["userId"]!!
        return cell
    }
}
