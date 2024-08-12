//
//  RowView.swift
//  MyGuessNumber
//
//  Created by user on 2024/08/04.
//

import SwiftUI

struct RowView: View {
    
    let record: Record
    
    var body: some View {
        HStack {
            Text("\(record.times)回目：")
            Text(record.number + "：")
            Text("\(record.hit) hit ")
                .underline()
            Text("\(record.blow) blow")
                .underline()
        }
    }
}

#Preview {
    RowView(record: Record(times: 0, number: "123456", hit: 3, blow: 3))
}
