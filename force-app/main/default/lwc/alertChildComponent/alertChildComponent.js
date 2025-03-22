import { api, LightningElement } from 'lwc';

export default class AlertChildComponent extends LightningElement {
    @api message
    @api className

    get alertClassName() {
        console.log('Final class applied:', this.className ? 'alert ' + this.className : 'alert');
        return this.className ? 'alert ' + this.className : 'alert';
    }
    
}