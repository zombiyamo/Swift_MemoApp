//
//  EditViewController.swift
//  MemoApp
//
//  Created by wadadon on 2015/02/01.
//  Copyright (c) 2015年 DAWA. All rights reserved.
//

import UIKit


class EditViewController: UIViewController {
    
    @IBOutlet var editView : UITextView!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var tool : UINavigationBar!
    
    var aleart = UIAlertView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editView.textColor = UIColor.whiteColor()
        editView.text=text   //内容をセット
        editView.backgroundColor = nil  //背景透過
        
        //NavigationControllerの文字色の変更
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        // NavigationControllerのNavigationItemの色
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        
        // ブラーエフェクトを生成（ここでエフェクトスタイルを指定する）
        let blurEffect = UIBlurEffect(style: .Light)
        
        // ブラーエフェクトからエフェクトビューを生成
        var visualEffectView = UIVisualEffectView(effect: blurEffect)
        
        // エフェクトビューのサイズを指定（オリジナル画像と同じサイズにする）
        visualEffectView.frame = self.view.frame
        //visualEffectView.frame=self.imageView.bounds
        
        // 画像にエフェクトビューを貼り付ける
        imageView.addSubview(visualEffectView)
        
        //toobarの設定
        tool.barStyle=UIBarStyle.Black
        tool.tintColor=UIColor.orangeColor()
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent  //ステータスバー
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(){
        dismissViewControllerAnimated(true, completion: nil)   //画面遷移
        editView!.resignFirstResponder()   //キーボード閉じる
    }
    
    @IBAction func edit(){
        
        //メモ内容の変更を保存
        
        println(memo)
        
        memo[cellNum] = editView.text  //arrayにwriteViewの内容を追加
        println(memo)
        UD.setObject(memo, forKey: "array")   //メモ内容保存
        println(memo)
        UD.synchronize()   //あったほうが良い?
        
        self.view.endEditing(true)   //キーボードを閉じる
        
        aleart.title = "Save"
        aleart.addButtonWithTitle("OK")
        aleart.show()
        
        dismissViewControllerAnimated(true, completion: nil)   //トップページに戻る
        
    }
    
    
}
