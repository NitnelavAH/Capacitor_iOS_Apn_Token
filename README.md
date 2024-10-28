# capacitor-ios-apn-token

Get the iOS APNs Token: If you're using @capacitor/push-notifications and need the iOS APNs token (not the FCM token), this plugin provides direct access to it.

it works with clevertap cordova SDK
## Install

```bash
npm install capacitor-ios-apn-token
npx cap sync
```

## Configuration
In AppDelegate.swift, add the following code inside the didRegisterForRemoteNotificationsWithDeviceToken method:
```
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    NotificationCenter.default.post(name: Notification.Name("didRegisterForRemoteNotificationsWithDeviceToken"), object: deviceToken)
}
```

if you use @capacitor/push-notifications the code can see like that

```
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().token(completion: { (token, error) in
            if let error = error {
                NotificationCenter.default.post(name: .capacitorDidFailToRegisterForRemoteNotifications, object: error)
            } else if let token = token {
                print(token);
                NotificationCenter.default.post(name: .capacitorDidRegisterForRemoteNotifications, object: token)
                NotificationCenter.default.post(name: Notification.Name("didRegisterForRemoteNotificationsWithDeviceToken"), object: deviceToken)
            }
          })
    }

```

## Example
using @capacitor/push-notifications
```
import { Capacitor } from '@capacitor/core';
import { ActionPerformed, PushNotifications, PushNotificationSchema, Token,  } from '@capacitor/push-notifications';
import { Device } from '@capacitor/device';
import { CapacitorApnToken } from 'capacitor-ios-apn-token';

@Injectable({
  providedIn: 'root'
})
export class NotificationsService {

  constructor(

    ) { }

  public initPush() {
    if(Capacitor.getPlatform() !== 'web') {
      this.registerPush();
    }
  }

  private registerPush() {
    localStorage.removeItem('notificationsToken');
    PushNotifications.requestPermissions().then((permission) => {
      if(permission.receive === 'granted') {
        PushNotifications.register();
      }
    });

    PushNotifications.addListener(
      'registration',
      (token: Token) => {
        if(token.value == this.getNotificationsToken) return;
        this.setNotificationsToken(token.value);
      }
    );

    PushNotifications.addListener('registrationError', (error: any) => {
    });

    PushNotifications.addListener('pushNotificationReceived',
    async (notification: PushNotificationSchema) => {
    });

    PushNotifications.addListener(
      'pushNotificationActionPerformed',
      async (notification: ActionPerformed) => {
       
      }
    );
  }

  get getNotificationsToken() {
    return localStorage.getItem('notificationsToken');
  }


  private async setNotificationsToken(fcmToken: string) {
   
    localStorage.setItem('notificationsToken', token);
    const deviceInfo = await Device.getInfo();
    if(deviceInfo.platform === 'ios') {
      try {
        //APN token
        const {token} = await CapacitorApnToken.getApnsToken();
      } catch (error) {
      }
      return
    };

    // use fcm token

  }
}
```
## API

<docgen-index>

* [`getApnsToken()`](#getapnstoken)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### getApnsToken()

```typescript
getApnsToken() => Promise<{ token: string; }>
```

**Returns:** <code>Promise&lt;{ token: string; }&gt;</code>

--------------------

</docgen-api>
