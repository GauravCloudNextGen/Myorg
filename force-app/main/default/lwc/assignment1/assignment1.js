import { LightningElement,wire,api,track} from 'lwc';
import userInfo from '@salesforce/apex/UserData.userInfo';
import FirstName from '@salesforce/schema/User.FirstName';
import LastName from '@salesforce/schema/User.LastName';
import Alias from '@salesforce/schema/User.Alias';
import UserName from '@salesforce/schema/User.Username';
import Nickname from '@salesforce/schema/User.CommunityNickname';
import Email from '@salesforce/schema/User.Email';
import TimeZoneSidKey from '@salesforce/schema/User.TimeZoneSidKey';
import LocaleSidKey from '@salesforce/schema/User.LocaleSidKey';
import EmailEncodingKey from '@salesforce/schema/User.EmailEncodingKey';
import ProfileId from '@salesforce/schema/User.ProfileId';
import LanguageLocaleKey from '@salesforce/schema/User.LanguageLocaleKey';
import IsActive from '@salesforce/schema/User.IsActive';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { RefreshEvent } from "lightning/refresh";
export default class Assignment1 extends LightningElement {
    @track params
    wiredResult
    @wire(userInfo)
    wiredCallback(result) {
        this.wiredResult = result;
        refreshApex(this.wiredResult);
        const {data,error} = result;
        if (data) {
            this.params = data;
            this.error = undefined;
            console.log('hi');
        } else if (error) {
            this.error = error;
            this.params = undefined;
        }
    }
    create=false;
    @api recordId;
    editRecord = false;
    columns = [
        { label:'Name',fieldName:'Name' },
        { label:'UserName',fieldName:'UserName' },
        { label:'IsActive', fieldName:'IsActive'},
        {label:'Email',fieldName:'Email'},
        { 
            label: 'Actions', 
            type: 'button', 
            typeAttributes: { label: 'Edit', value: 'edit_user' } 
        }
    ];

    createNewUser(Event){
        this.create = true
        console.log(this.create);
    }

    selectedFields=[FirstName,LastName,Alias,UserName,Nickname,Email,TimeZoneSidKey,LocaleSidKey,EmailEncodingKey,ProfileId,LanguageLocaleKey];
    fields=[FirstName,LastName,Email,IsActive];

    hideModalBox(event){
        this.create = false;
        this.editRecord = false;
    }

    handleRowAction(event){
        if (event.detail.action.value === 'edit_user'){
            this.getUpdatedData()
            this.editRecord = true;
            console.log('open edit ' + this.editRecord);
            this.recordId = event.detail.row.Id;
        }
    }

    handleSuccess(){
             if(this.recordId != null){
                refreshApex(this.wiredResult);
                this.create = false;
                this.dispatchEvent(new ShowToastEvent({
                        title: "SUCCESS!",
                        message: "New record has been created.",
                        variant: "success",
                    }),  
                );
                refreshApex(this.wiredResult);
            }
        }

        handleSubmit(){
            if(this.recordId != null){
                refreshApex(this.wiredResult);
                console.log(this.wiredResult);
                this.editRecord = false;
                this.dispatchEvent(new ShowToastEvent({
                       title: "SUCCESS!",
                       message: "Record has been Updated.",
                       variant: "success"
                   }),
               );
               refreshApex(this.wiredResult);
            }
       }   
       getUpdatedData(event){
        refreshApex(this.wiredResult);
       } 
    }