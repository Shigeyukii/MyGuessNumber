//
//  GameView.swift
//  MyGuessNumber
//
//  Created by user on 2024/07/31.
//

import SwiftUI

struct GameView: View {
    @State var message: String = "すうじをあててね"
    @State var cbox1: Int = 0
    @State var cbox2: Int = 0
    @State var cbox3: Int = 0
    @State var cbox4: Int = 0
    @State var cbox5: Int = 0
    @State var cbox6: Int = 0
    
    @State private var records: [Record] = [Record(times: 0, number: "000000", hit: 0, blow: 0)]
    @State var sortRecords: [Record] = [Record(times: 0, number: "000000", hit: 0, blow: 0)]
    
    @State var times: Int = 0
    @State var numbers: [String] = []
    @State var hit: Int = 0
    @State var blow: Int = 0
    
    @State var boxCnt: Int = 1
    
    @State var box1: Int = 0
    @State var box2: Int = 0
    @State var box3: Int = 0
    @State var box4: Int = 0
    @State var box5: Int = 0
    @State var box6: Int = 0
    
    @State var btnNum: Int = 0
    @State var btn1: Bool = true
    @State var btn2: Bool = true
    @State var btn3: Bool = true
    @State var btn4: Bool = true
    @State var btn5: Bool = true
    @State var btn6: Bool = true
    @State var btn7: Bool = true
    @State var btn8: Bool = true
    @State var btn9: Bool = true
    
    var body: some View {
        VStack {
            Text(message)
                .padding()
                .onAppear {
                    initCbox()
                }
            
            //Spacer()
            
            HStack {
                
                if hit == 6 {
                    Button {
                        message = "すうじをあててね"
                        
                        initCbox()
                        
                        boxCnt = 1
                        box1 = 0
                        box2 = 0
                        box3 = 0
                        box4 = 0
                        box5 = 0
                        box6 = 0
                        
                        btnNum = 0
                        btn1 = true
                        btn2 = true
                        btn3 = true
                        btn4 = true
                        btn5 = true
                        btn6 = true
                        btn7 = true
                        btn8 = true
                        btn9 = true
                        
                        hit = 0
                        blow = 0
                        
                        records = [Record(times: 0, number: "000000", hit: 0, blow: 0)]
                        sortRecords = [Record(times: 0, number: "000000", hit: 0, blow: 0)]

                    } label: {
                        Text("もういっかい")
                    }
                    Text("\(cbox1)")
                    Text("\(cbox2)")
                    Text("\(cbox3)")
                    Text("\(cbox4)")
                    Text("\(cbox5)")
                    Text("\(cbox6)")
                } else {
                    Image(systemName: "questionmark.circle")
                    Image(systemName: "questionmark.circle")
                    Image(systemName: "questionmark.circle")
                    Image(systemName: "questionmark.circle")
                    Image(systemName: "questionmark.circle")
                    Image(systemName: "questionmark.circle")
                }
            }
            .padding()
            
            List {
                /*ForEach(numbers, id: \.self ) { number in
                    Text("\(times)回目：" + number + "：\(hit) hit \(blow) blow")
                }*/
                /*ForEach(records, id: \.times ) { record in
                    if record.times != 0 {
                        RowView(record: record)
                    }
                }*/

                ForEach(sortRecords, id: \.times ) { sortRecord in
                    if sortRecord.times != 0 {
                        RowView(record: sortRecord)
                            .font(.footnote)
                    }
                }
            }
            .listRowInsets(.init())
            .padding()
            
            HStack {
                if box1 == 0 {
                    Image(systemName: "square")
                    //Text("🔲")
                } else {
                    Text("\(box1)")
                }
                
                if box2 == 0 {
                    Image(systemName: "square")
                } else {
                    Text("\(box2)")
                }
                
                if box3 == 0 {
                    Image(systemName: "square")
                } else {
                    Text("\(box3)")
                }
                
                if box4 == 0 {
                    Image(systemName: "square")
                } else {
                    Text("\(box4)")
                }
                
                if box5 == 0 {
                    Image(systemName: "square")
                } else {
                    Text("\(box5)")
                }
                
                if box6 == 0 {
                    Image(systemName: "square")
                } else {
                    Text("\(box6)")
                }
                
                Button {
                    boxBack()
                } label: {
                    Text("Back")
                }
            }
            
            /*HStack {
                // reset ボタン処理
                Button {
                    
                } label: {
                    Text("Reset")
                }
                // back 戻るボタン処理
                Button {
                    boxBack()
                } label: {
                    Text("Back")
                }
            }
            .padding()
            */

            //
            // Goボタンが押されたら Hit か Blow をチェックする
            //
            // reset ボタン処理
            HStack {
                
                Button {
                    boxCnt = 1
                    box1 = 0
                    box2 = 0
                    box3 = 0
                    box4 = 0
                    box5 = 0
                    box6 = 0
                    
                    btnNum = 0
                    btn1 = true
                    btn2 = true
                    btn3 = true
                    btn4 = true
                    btn5 = true
                    btn6 = true
                    btn7 = true
                    btn8 = true
                    btn9 = true
                    
                } label: {
                    Text("Reset")
                        .padding()
                }
                
                if boxCnt != 7 {
                    
                    Text("Go")
                        .padding()
                    
                } else if boxCnt == 7 {
                    Button {
                        checkHitBlow()
                    } label: {
                        Text("Go")
                            .padding()
                    }
                }
            }
            HStack {
                if btn1 {
                    Button {
                        btnNum = 1
                        btn1 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("1")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("1")
                        .font(.title)
                        .padding()
                }
                
                if btn2 {
                    Button {
                        btnNum = 2
                        btn2 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("2")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("2")
                        .font(.title)
                        .padding()
                }
                
                if btn3 {
                    Button {
                        btnNum = 3
                        btn3 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("3")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("3")
                        .font(.title)
                        .padding()
                }
            }
            .font(.largeTitle)
            
            HStack {
                if btn4 {
                    Button {
                        btnNum = 4
                        btn4 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("4")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("4")
                        .font(.title)
                        .padding()
                }
                
                if btn5 {
                    Button {
                        btnNum = 5
                        btn5 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("5")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("5")
                        .font(.title)
                        .padding()
                }
                
                if btn6 {
                    Button {
                        btnNum = 6
                        btn6 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("6")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("6")
                        .font(.title)
                        .padding()
                }
            }
            .font(.largeTitle)
            
            HStack {
                if btn7 {
                    Button {
                        btnNum = 7
                        btn7 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("7")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("7")
                        .font(.title)
                        .padding()
                }
                
                if btn8 {
                    Button {
                        btnNum = 8
                        btn8 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("8")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("8")
                        .font(.title)
                        .padding()
                }
                
                if btn9 {
                    Button {
                        btnNum = 9
                        btn9 = false
                        boxAdd(btnNum: btnNum)
                    } label: {
                        Text("9")
                            .font(.title)
                            .padding()
                    }
                } else {
                    Text("9")
                        .font(.title)
                        .padding()
                }
            }
            .font(.largeTitle)
        }
        Spacer()
    }
    
    func initCbox() {
        cbox1 = Int.random(in: 1...9)
        repeat {
            cbox2 = Int.random(in: 1...9)
        } while (cbox1 == cbox2)
        
        repeat {
            cbox3 = Int.random(in: 1...9)
        } while ((cbox1 == cbox3) || (cbox2 == cbox3))
        
        repeat {
            cbox4 = Int.random(in: 1...9)
        } while ((cbox1 == cbox4) || (cbox2 == cbox4) || (cbox3 == cbox4))
        
        repeat {
            cbox5 = Int.random(in: 1...9)
        } while ((cbox1 == cbox5) || (cbox2 == cbox5) || (cbox3 == cbox5) || (cbox4 == cbox5))
        
        repeat {
            cbox6 = Int.random(in: 1...9)
        } while ((cbox1 == cbox6) || (cbox2 == cbox6) || (cbox3 == cbox6) || (cbox4 == cbox6) || (cbox5 == cbox6))
        
        return
    }
    
    func checkHitBlow() {
        times += 1
        let num: String = "\(box1)" + "\(box2)" + "\(box3)" + "\(box4)" + "\(box5)" + "\(box6)"
        print("\(num)")
        numbers.append(num)
        print(numbers)
        
        hit = 0
        blow = 0
        // Hit と Blow をカウントする
        if box1 == cbox1 {
            hit += 1
        } else if ((box1 == cbox2) || (box1 == cbox3) || (box1 == cbox4) || (box1 == cbox5) || (box1 == cbox6)) {
            blow += 1
        }
        if box2 == cbox2 {
            hit += 1
        } else if ((box2 == cbox1) || (box2 == cbox3) || (box2 == cbox4) || (box2 == cbox5) || (box2 == cbox6)) {
            blow += 1
        }
        if box3 == cbox3 {
            hit += 1
        } else if ((box3 == cbox1) || (box3 == cbox2) || (box3 == cbox4) || (box3 == cbox5) || (box3 == cbox6)) {
            blow += 1
        }
        if box4 == cbox4 {
            hit += 1
        } else if ((box4 == cbox1) || (box4 == cbox2) || (box4 == cbox3) || (box4 == cbox5) || (box4 == cbox6)) {
            blow += 1
        }
        if box5 == cbox5 {
            hit += 1
        } else if ((box5 == cbox1) || (box5 == cbox2) || (box5 == cbox3) || (box5 == cbox4) || (box5 == cbox6)) {
            blow += 1
        }
        if box6 == cbox6 {
            hit += 1
        } else if ((box6 == cbox1) || (box6 == cbox2) || (box6 == cbox3) || (box6 == cbox4) || (box6 == cbox5)) {
            blow += 1
        }
        
        let newRecord = Record(times: times, number: num, hit: hit, blow: blow)
        records.append(newRecord)
        print(records)
        sortRecords = records.sorted(by: {$0.times > $1.times})

        if hit == 6 {
            message = "正解"
        }
    }
    
    func boxBack() {
        let backBoxNum = boxCnt - 1
        //print("\(backBoxNum)")
        switch backBoxNum {
        case 1:
            switch box1 {
            case 1:
                box1 = 0
                btn1 = true
            case 2:
                box1 = 0
                btn2 = true
            case 3:
                box1 = 0
                btn3 = true
            case 4:
                box1 = 0
                btn4 = true
            case 5:
                box1 = 0
                btn5 = true
            case 6:
                box1 = 0
                btn6 = true
            case 7:
                box1 = 0
                btn7 = true
            case 8:
                box1 = 0
                btn8 = true
            case 9:
                box1 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
            
        case 2:
            switch box2 {
            case 1:
                box2 = 0
                btn1 = true
            case 2:
                box2 = 0
                btn2 = true
            case 3:
                box2 = 0
                btn3 = true
            case 4:
                box2 = 0
                btn4 = true
            case 5:
                box2 = 0
                btn5 = true
            case 6:
                box2 = 0
                btn6 = true
            case 7:
                box2 = 0
                btn7 = true
            case 8:
                box2 = 0
                btn8 = true
            case 9:
                box2 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
            
        case 3:
            switch box3 {
            case 1:
                box3 = 0
                btn1 = true
            case 2:
                box3 = 0
                btn2 = true
            case 3:
                box3 = 0
                btn3 = true
            case 4:
                box3 = 0
                btn4 = true
            case 5:
                box3 = 0
                btn5 = true
            case 6:
                box3 = 0
                btn6 = true
            case 7:
                box3 = 0
                btn7 = true
            case 8:
                box3 = 0
                btn8 = true
            case 9:
                box3 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
            
        case 4:
            switch box4 {
            case 1:
                box4 = 0
                btn1 = true
            case 2:
                box4 = 0
                btn2 = true
            case 3:
                box4 = 0
                btn3 = true
            case 4:
                box4 = 0
                btn4 = true
            case 5:
                box4 = 0
                btn5 = true
            case 6:
                box4 = 0
                btn6 = true
            case 7:
                box4 = 0
                btn7 = true
            case 8:
                box4 = 0
                btn8 = true
            case 9:
                box4 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
            
        case 5:
            switch box5 {
            case 1:
                box5 = 0
                btn1 = true
            case 2:
                box5 = 0
                btn2 = true
            case 3:
                box5 = 0
                btn3 = true
            case 4:
                box5 = 0
                btn4 = true
            case 5:
                box5 = 0
                btn5 = true
            case 6:
                box5 = 0
                btn6 = true
            case 7:
                box5 = 0
                btn7 = true
            case 8:
                box5 = 0
                btn8 = true
            case 9:
                box5 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
            
        case 6:
            switch box6 {
            case 1:
                box6 = 0
                btn1 = true
            case 2:
                box6 = 0
                btn2 = true
            case 3:
                box6 = 0
                btn3 = true
            case 4:
                box6 = 0
                btn4 = true
            case 5:
                box6 = 0
                btn5 = true
            case 6:
                box6 = 0
                btn6 = true
            case 7:
                box6 = 0
                btn7 = true
            case 8:
                box6 = 0
                btn8 = true
            case 9:
                box6 = 0
                btn9 = true
            default:
                print("Why do this code !?")
            }
        default:
            print("Why do this code !?")
        }
        if boxCnt >= 2 {
            boxCnt -= 1
        }
    }
    
    func boxAdd(btnNum: Int) {
        //print("\(boxCnt)")
        //print("\(btnNum)")
        if boxCnt <= 6 {
            switch boxCnt {
            case 1:
                box1 = btnNum
            case 2:
                box2 = btnNum
            case 3:
                box3 = btnNum
            case 4:
                box4 = btnNum
            case 5:
                box5 = btnNum
            case 6:
                box6 = btnNum
            default:
                print("Why do this line?")
            }
            
            boxCnt += 1
            
        } else {
            print("aaaa\(btnNum)")

            switch btnNum {
            case 1:
                btn1 = true
            case 2:
                btn2 = true
            case 3:
                btn3 = true
            case 4:
                btn4 = true
            case 5:
                btn5 = true
            case 6:
                btn6 = true
            case 7:
                btn7 = true
            case 8:
                btn8 = true
            case 9:
                btn9 = true
                
            default:
                print("Why do this line")
            }
        }
    }
}


#Preview {
    GameView()
}
