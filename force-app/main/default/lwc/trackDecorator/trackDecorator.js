import { LightningElement , track } from 'lwc';

export default class TrackDecorator extends LightningElement {
    @track message="world";

    handleChange(event){
        console.log('event.target.value ' + event.target.value);
        this.message = event.target.value;
    }
}