import { LightningElement , track } from 'lwc';

export default class LWC1 extends LightningElement {

    @track inputValue = '';
    @track showValue = '';

    handleChange(event){
        this.inputValue = event.detail.value;
    }

    handleClick(event){
        this.showValue = this.inputValue;
        console.log(this.showValue);
    }
}