import Foundation

class KakaoAuthManager: ObservableObject {
    static let shared = KakaoAuthManager()
    
    private let clientID = "너의 REST API 키"
    private let redirectURI = "myapp://oauth"
    
    @Published var userInfo: [String: Any] = [:]
    
    func handleRedirectURL(_ url: URL) async {
        guard let code = extractCode(from: url) else { return }
        await fetchToken(code: code)
    }
    
    private func extractCode(from url: URL) -> String? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            return nil
        }
        return code
    }
    
    private func fetchToken(code: String) async {
        let tokenURL = URL(string: "https://kauth.kakao.com/oauth/token")!
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let body = "grant_type=authorization_code&client_id=\(clientID)&redirect_uri=\(redirectURI)&code=\(code)"
        request.httpBody = body.data(using: .utf8)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            print("Token JSON: \(json ?? [:])")
            
            if let accessToken = json?["access_token"] as? String {
                await fetchUserInfo(token: accessToken)
            }
        } catch {
            print("Token fetch error: \(error)")
        }
    }
    
    private func fetchUserInfo(token: String) async {
        let url = URL(string: "https://kapi.kakao.com/v2/user/me")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            print("User Info: \(json ?? [:])")
            
            DispatchQueue.main.async {
                self.userInfo = json ?? [:]
            }
        } catch {
            print(" User info error: \(error)")
        }
    }
}
