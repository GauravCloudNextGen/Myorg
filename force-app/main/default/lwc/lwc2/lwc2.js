import { LightningElement , wire } from 'lwc';
import getAccountName from '@salesforce/apex/LWC2Class.getAccountName';
export default class Lwc2 extends LightningElement {

    @wire(getAccountName)
    accounts;
}