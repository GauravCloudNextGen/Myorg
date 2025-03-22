import { LightningElement } from 'lwc';
import Name from '@salesforce/schema/opportunity_product_Amount_calculation__c.Name';
import Product__c from '@salesforce/schema/opportunity_product_Amount_calculation__c.Product__c';
import Min__c from '@salesforce/schema/opportunity_product_Amount_calculation__c.Min__c';
import Max__c from '@salesforce/schema/opportunity_product_Amount_calculation__c.Max__c';
import Price__c from '@salesforce/schema/opportunity_product_Amount_calculation__c.Price__c';
import getData from '@salesforce/apex/opacRec.getData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Assignment3 extends LightningElement {
    newRec = false;
    productId = ''
    params = ''
    displayInfoProduct = {
        primaryField: 'Name'
    };
    openModal(event) {
        this.newRec = true
    }
    hideModalBox(event) {
        this.newRec = false
    }
    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Product', fieldName: 'Product__c' },
        { label: 'Min', fieldName: 'Min__c' },
        { label: 'Max', fieldName: 'Max__c' },
        { label: 'Price', fieldName: 'Price__c' }
    ];
    async displayRec(event) {
        this.productId = event.detail.recordId;
        this.params = await getData({ recId:event.detail.recordId});
    }
    selectedFields = [Name, Product__c, Min__c, Max__c, Price__c];
    handleSuccess() {
        this.newRec = false;
        this.dispatchEvent(new ShowToastEvent({
            title: "SUCCESS!",
            message: "Record has been Created.",
            variant: "success"
        }),
        );
    }
}