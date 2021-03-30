//
//  Model.swift
//  IOS_NIS_Exam
//
//  Created by Egor Dadugin on 30.03.2021.
//

import Foundation

var likedPages : [String] = []

func saveData(){
    UserDefaults.standard.setValue(likedPages, forKey: "likedPages")
    UserDefaults.standard.synchronize()
}

func loadData(){
    likedPages = UserDefaults.standard.stringArray(forKey: "likedPages")!
}
