//
//  OnBoardingView.swift
//  Diptych
//
//  Created by HAN GIBAEK on 2023/07/13.
//

import SwiftUI

struct OnBoardingView: View {
//    @EnvironmentObject var authViewModel: AuthenticationViewModel
    /// 카메라 표시 여부
    @State var isShowCamera = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                VStack() {
                    Spacer()
                        .frame(height: 124)
                    Text("딥틱에서 매일 서로의 일상을 하나의 사진으로 완성해요")
                        .font(.pretendard(.light, size: 28))
                        .padding(.leading, 41)
                        .padding(.trailing, 41)
                    Spacer()
                        .frame(height: 28)
                    Image("diptych_sample1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 393, height: 393)
                        // 임시로 누르면 카메라 뜨도록 했고 나중에 다 지우겠습니다 (Cliff)
                        .onTapGesture {
                            isShowCamera = true
                        }
                    Spacer()
                    VStack(spacing: 10) { // (S) LogIn, SignUp
                        NavigationLink(destination: LogInView()) {
                            Text("로그인")
                                .frame(width: UIScreen.main.bounds.width-30, height:  60)
                                .background(Color.offBlack)
                                .foregroundColor(.offWhite)
                                .border(Color.offBlack)
                        }
                        NavigationLink(destination: SignUpView()) {
                            Text("회원가입")
                                .frame(width: UIScreen.main.bounds.width-30, height:  60)
                                .background(Color.offWhite)
                                .foregroundColor(.offBlack)
                                .border(Color.offBlack)
                        }
                        
                    }// (E) LogIn, SignUp
                    Spacer()
                        .frame(height: 55)
                }
                .ignoresSafeArea()
            }
//            .onAppear {
//                print("user: \(authViewModel.user)")
//                print("user: \(authViewModel.user?.isEmailVerified)")
//                print("state: \(authViewModel.authenticationState)")
//            }
        }
        .fullScreenCover(isPresented: $isShowCamera) {
            CameraRepresentableView()
                 .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .environmentObject(AuthenticationViewModel())
    }
}
