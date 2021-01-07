//
//  ContentView.swift
//  SwiftUIBatteryState
//
//  Created by db J on 2020/12/21.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var batteryLevel: Float = 0.00
    @Published var batteryState: String = "未知"
    @Published var batteryContainer: String = "未知"
    @Published var batteryPower: String = "未知"
    
    init() {

        let helper:batteryService =  batteryService()
        helper.batteryStateResults = {(newbatteryState)  in
            //刷新你的ui
            print(newbatteryState)
            self.batteryState = newbatteryState
        }

        helper.batteryLevelResults = { (leve) in
            //刷新你的ui
            print(leve)
            self.batteryLevel = leve
        }
        
        helper.batteryContainerResults = { (container) in
            print(container)
            self.batteryContainer = container
        }
        
        helper.batteryPowerResults = { (power) in
            print(power)
            self.batteryPower = power
        }

    }
    
}


struct ContentView: View {

    @ObservedObject var model = Model()
    @State var showPop = false
    
    var body: some View {
        NavigationView{
            VStack {
                RingView()
                Text("batteryState: \(model.batteryState)")
                Text("batteryLevel: \(model.batteryLevel)")
                Text("batteryContainer: \(model.batteryContainer)")
                Text("batteryPower: \(model.batteryPower)")
                
                Button("PopOverModal跳转示例") {
                    //每次打印isPopOver都是false,说明这是一个状态位标识
                    print(self.showPop)
                    self.showPop = true
                }
                .fullScreenCover(isPresented: $showPop, content: FullScreenModalView.init)
                /*.popover(isPresented: $showPop, content: {
                    CardBottomView()
                })*/
                
                Button(action: {
                    print("Tap")
                    self.showPop = true
                }) {
                    Text("I'm a Button").bold()
                        .font(.system(size: 40,design: .rounded))
                        .shadow(radius: 1)
                }.sheet(isPresented: $showPop, onDismiss: {
                    print("dissmiss Model")
                }) {
                    FullScreenModalView()
                    //CardBottomView()
                }
                
                NavigationLink(destination: NextView()) {
                    Text("NavigationButton").bold()
                        .foregroundColor(.orange)
                        .font(.largeTitle)
                    }
            }
        }
        
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            CardBottomView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.2))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("ad发货地of地方叫都叫欧迪芬恐怕发快递搜房卡是都开发的伤口欧派的疯狂的搜发快递佛龛的是佛防控")
                .font(.body)
                .lineLimit(5)
            Spacer()
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: UIScreen.main.bounds.height - 400)
    }
}


struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
