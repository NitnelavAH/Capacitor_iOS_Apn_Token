import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorApnTokenPlugin)
public class CapacitorApnTokenPlugin: CAPPlugin, CAPBridgedPlugin  {

    public let identifier = "CapacitorApnTokenPlugin"
    public let jsName = "CapacitorApnToken"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "getApnsToken", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CapacitorApnToken()

    var apnsToken: String? = nil

    override public func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRegisterForRemoteNotifications(notification:)), name: NSNotification.Name("didRegisterForRemoteNotificationsWithDeviceToken"), object: nil)
    }

    @objc func getApnsToken(_ call: CAPPluginCall) {
        if let token = apnsToken {
            call.resolve([
                "token": token
            ])
        } else {
            call.reject("APNs token not available yet")
        }
    }

    @objc private func didRegisterForRemoteNotifications(notification: Notification) {
        if let tokenData = notification.object as? Data {
            let tokenParts = tokenData.map { data in String(format: "%02.2hhx", data) }
            apnsToken = tokenParts.joined()
            print("APNs Device Token: \(apnsToken ?? "")")
        }
    }
}
