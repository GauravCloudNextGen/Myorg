import { LightningElement } from 'lwc';
import lightningAlert from 'lightning/alert';
export default class AlertModalExample extends LightningElement {
    async showAlert(){
        await lightningAlert.open({
            message: "This is the alert message.",
            theme: "error",
            label: "Error!",
        })
    }
}