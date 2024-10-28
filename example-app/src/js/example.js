import { CapacitorApnToken } from 'capacitor-ios-apn-token';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapacitorApnToken.echo({ value: inputValue })
}
