//
//  jsonController.swift
//  ApiSumple
//
//  Created by 渡邊涼太 on 2024/09/21.
//

import Foundation

//JSONデータをswiftに変更していく
func getData(name: String) async throws -> Gender_jadge{
    do {
        let url_string = "https://api.genderize.io/?name=" + name
        print(url_string)
        
        guard let url = URL(string: url_string) else { throw URLError(.badURL) }
        
        var request = URLRequest(url:url)
        //request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let jender = try JSONDecoder().decode(Gender_jadge.self, from: data)
        return jender
        
    }catch{
        print("error_getData")
        throw error
    }
}
