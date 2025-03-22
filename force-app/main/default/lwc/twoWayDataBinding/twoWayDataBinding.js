import { LightningElement , track } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    @track fullname = "Gaurav Atreja";
    @track title = "Salesforce Developer";

    changeHandler(event){
        this[event.target.name]= event.target.value;
    }
}